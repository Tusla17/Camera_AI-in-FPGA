import torch
from torchvision import datasets, transforms
from torch.utils.data import DataLoader

IMG = 32

tf_train = transforms.Compose([
    transforms.Grayscale(1),
    transforms.Resize((IMG, IMG)),
    transforms.RandomRotation(10),
    transforms.RandomHorizontalFlip(),
    transforms.ToTensor(),
    transforms.Normalize([0.5], [0.5]),
])
tf_val = transforms.Compose([
    transforms.Grayscale(1),
    transforms.Resize((IMG, IMG)),
    transforms.ToTensor(),
    transforms.Normalize([0.5], [0.5]),
])

def get_loaders(root="data", bs=128):
    tr = datasets.ImageFolder(f"{root}/train", tf_train)
    va = datasets.ImageFolder(f"{root}/val", tf_val)
    return (DataLoader(tr, bs, shuffle=True,  num_workers=4, drop_last=True),
            DataLoader(va, bs, shuffle=False, num_workers=4),
            tr.classes)
