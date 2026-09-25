import torch, numpy as np
import torch.nn.functional as F
from pathlib import Path
from torchvision import datasets
from model import BNNEye, binarize
from data import tf_val

OUT = Path("export"); OUT.mkdir(exist_ok=True)
net = BNNEye(2)
net.load_state_dict(torch.load("bnn_eye_best.pt", map_location="cpu"))
net.eval()

def bin01(w):                       # +1 -> 1, -1 -> 0
    return (torch.sign(w) > 0).to(torch.uint8).cpu().numpy()

# 1) Trọng số nhị phân + bit-pack (packbits MSB-first)
for name, layer in {"conv1":net.conv1,"conv2":net.conv2,
                    "conv3":net.conv3,"fc1":net.fc1}.items():
    wb = bin01(layer.weight.data)
    np.save(OUT/f"{name}_w01.npy", wb)
    packed = np.packbits(wb.reshape(wb.shape[0], -1), axis=1)
    np.save(OUT/f"{name}_w_packed.npy", packed)
    print(f"{name}: w{tuple(wb.shape)} -> packed {packed.shape}")

# 2) Fold BatchNorm -> ngưỡng tau (sign(BN(z)) đổi dấu tại z = tau)
for name, bn in {"bn1":net.bn1,"bn2":net.bn2,
                 "bn3":net.bn3,"bnf":net.bnf}.items():
    g=bn.weight.data.numpy(); b=bn.bias.data.numpy()
    mu=bn.running_mean.numpy(); var=bn.running_var.numpy(); eps=bn.eps
    tau = mu - b*np.sqrt(var+eps)/g
    np.savez(OUT/f"{name}_fold.npz", tau=tau,
             sign_flip=(g<0).astype(np.uint8),
             gamma=g, beta=b, mean=mu, var=var, eps=eps)
    print(f"{name}: sign_flip = {int((g<0).sum())}/{len(g)}")

# 3) Lớp đầu ra thực (fc2)
np.savez(OUT/"fc2.npz", weight=net.fc2.weight.data.numpy(),
         bias=net.fc2.bias.data.numpy())

# 4) Golden vectors: I/O từng lớp, lấy cân bằng cả closed lẫn open
@torch.no_grad()
def ref_forward(x):
    a = {"input": x}
    z = binarize(F.max_pool2d(net.bn1(net.conv1(x)), 2)); a["l1_bin"] = z
    z = binarize(F.max_pool2d(net.bn2(net.conv2(z)), 2)); a["l2_bin"] = z
    z = binarize(F.max_pool2d(net.bn3(net.conv3(z)), 2)); a["l3_bin"] = z
    z = binarize(net.bnf(net.fc1(z.flatten(1))));         a["fc1_bin"] = z
    a["logits"] = net.fc2(z)
    return a

val = datasets.ImageFolder("data/val", tf_val)
# 4 ảnh đầu (closed) + 4 ảnh cuối (open) -> golden có đủ 2 lớp
idxs = [0, 1, 2, 3, len(val)-1, len(val)-2, len(val)-3, len(val)-4]
for n, i in enumerate(idxs):
    x, y = val[i]
    acts = ref_forward(x.unsqueeze(0))
    np.savez(OUT/f"golden_{n}.npz", label=y,
             **{k: v.detach().cpu().numpy() for k, v in acts.items()})
    print(f"golden_{n}: label={y}({val.classes[y]}) "
          f"pred={acts['logits'].argmax().item()}")
print("Xong! Xuất ở:", OUT.resolve())
