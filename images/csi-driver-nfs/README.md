# csi-driver-nfs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#csi-driver-nfs

# Load into Docker
nix build .#load-csi-driver-nfs-to-docker && ./result/bin/load-csi-driver-nfs-to-docker
```
