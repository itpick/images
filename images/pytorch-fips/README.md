# pytorch-fips

A minimal, wolfi-based FIPS compliant image for pytorch, a Python package that provides two high-level features: Tensor computation with strong GPU acceleration and Deep neural networks built on a tape-based autograd system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pytorch-fips

# Load into Docker
nix build .#load-pytorch-fips-to-docker && ./result/bin/load-pytorch-fips-to-docker
```
