# kubernetes-csi-driver-nfs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-driver-nfs

# Load into Docker
nix build .#load-kubernetes-csi-driver-nfs-to-docker && ./result/bin/load-kubernetes-csi-driver-nfs-to-docker
```
