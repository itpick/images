# csi-provisioner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 10s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#csi-provisioner

# Load into Docker
nix build .#load-csi-provisioner-to-docker && ./result/bin/load-csi-provisioner-to-docker
```
