# cni-plugins-tuning

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cni-plugins-tuning

# Load into Docker
nix build .#load-cni-plugins-tuning-to-docker && ./result/bin/load-cni-plugins-tuning-to-docker
```
