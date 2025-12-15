# cephcsi

CephCSI is the Container Storage Interface (CSI) driver for Ceph, providing support for RBD and CephFS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#cephcsi

# Load into Docker
nix build .#load-cephcsi-to-docker && ./result/bin/load-cephcsi-to-docker
```
