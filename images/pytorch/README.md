# pytorch

A minimal, wolfi-based image for pytorch, a Python package that provides two high-level features: Tensor computation with strong GPU acceleration and Deep neural networks built on a tape-based autograd system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pytorch

# Load into Docker
nix build .#load-pytorch-to-docker && ./result/bin/load-pytorch-to-docker
```
