# karpenter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#karpenter

# Load into Docker
nix build .#load-karpenter-to-docker && ./result/bin/load-karpenter-to-docker
```
