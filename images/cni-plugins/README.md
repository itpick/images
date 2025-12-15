# cni-plugins

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cni-plugins

# Load into Docker
nix build .#load-cni-plugins-to-docker && ./result/bin/load-cni-plugins-to-docker
```
