import torch, torch.nn as nn
from data import get_loaders
from model import BNNEye

dev = "cuda" if torch.cuda.is_available() else "cpu"
train_dl, val_dl, classes = get_loaders("data", bs=128)
print("classes:", classes, "| device:", dev)

net = BNNEye(len(classes)).to(dev)
opt = torch.optim.Adam(net.parameters(), lr=1e-3)
sched = torch.optim.lr_scheduler.CosineAnnealingLR(opt, T_max=30)
crit = nn.CrossEntropyLoss()

def evaluate():
    net.eval(); correct = total = 0
    with torch.no_grad():
        for x, y in val_dl:
            x, y = x.to(dev), y.to(dev)
            correct += (net(x).argmax(1) == y).sum().item()
            total += y.size(0)
    return correct / total

best = 0.0
for epoch in range(30):
    net.train()
    for x, y in train_dl:
        x, y = x.to(dev), y.to(dev)
        opt.zero_grad()
        loss = crit(net(x), y)
        loss.backward()
        opt.step()
    sched.step()
    acc = evaluate()
    print(f"epoch {epoch+1:02d}  loss {loss.item():.3f}  val_acc {acc:.4f}")
    if acc > best:
        best = acc
        torch.save(net.state_dict(), "bnn_eye_best.pt")
print("Best val acc:", best)
