import torch, torch.nn as nn, torch.nn.functional as F

class BinarizeSTE(torch.autograd.Function):
    @staticmethod
    def forward(ctx, x):
        ctx.save_for_backward(x)
        return torch.sign(x + 1e-20)
    @staticmethod
    def backward(ctx, g):
        (x,) = ctx.saved_tensors
        return g * (x.abs() <= 1).float()

def binarize(x):
    return BinarizeSTE.apply(x)

class BinaryConv2d(nn.Conv2d):
    def forward(self, x):
        return F.conv2d(x, binarize(self.weight), None, self.stride, self.padding)

class BinaryLinear(nn.Linear):
    def forward(self, x):
        return F.linear(x, binarize(self.weight), None)

class BNNEye(nn.Module):
    def __init__(self, num_classes=2):
        super().__init__()
        self.conv1 = BinaryConv2d(1, 32, 3, padding=1, bias=False)
        self.bn1   = nn.BatchNorm2d(32)
        self.conv2 = BinaryConv2d(32, 64, 3, padding=1, bias=False)
        self.bn2   = nn.BatchNorm2d(64)
        self.conv3 = BinaryConv2d(64, 64, 3, padding=1, bias=False)
        self.bn3   = nn.BatchNorm2d(64)
        self.fc1   = BinaryLinear(64*4*4, 128, bias=False)
        self.bnf   = nn.BatchNorm1d(128)
        self.fc2   = nn.Linear(128, num_classes)

    def forward(self, x):
        x = binarize(F.max_pool2d(self.bn1(self.conv1(x)), 2))
        x = binarize(F.max_pool2d(self.bn2(self.conv2(x)), 2))
        x = binarize(F.max_pool2d(self.bn3(self.conv3(x)), 2))
        x = x.flatten(1)
        x = binarize(self.bnf(self.fc1(x)))
        return self.fc2(x)
