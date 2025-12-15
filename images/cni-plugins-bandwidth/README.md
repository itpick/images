# cni-plugins-bandwidth

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cni-plugins-bandwidth

# Load into Docker
nix build .#load-cni-plugins-bandwidth-to-docker && ./result/bin/load-cni-plugins-bandwidth-to-docker
```
