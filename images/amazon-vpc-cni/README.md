# amazon-vpc-cni

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-vpc-cni

# Load into Docker
nix build .#load-amazon-vpc-cni-to-docker && ./result/bin/load-amazon-vpc-cni-to-docker
```
