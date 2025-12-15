# cni-plugins-portmap

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cni-plugins-portmap

# Load into Docker
nix build .#load-cni-plugins-portmap-to-docker && ./result/bin/load-cni-plugins-portmap-to-docker
```
