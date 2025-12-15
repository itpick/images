# flannel-cni-plugin

A plugin designed to work in conjunction with flannel, a network fabric for containers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flannel-cni-plugin

# Load into Docker
nix build .#load-flannel-cni-plugin-to-docker && ./result/bin/load-flannel-cni-plugin-to-docker
```
