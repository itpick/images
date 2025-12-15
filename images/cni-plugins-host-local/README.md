# cni-plugins-host-local

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cni-plugins-host-local

# Load into Docker
nix build .#load-cni-plugins-host-local-to-docker && ./result/bin/load-cni-plugins-host-local-to-docker
```
