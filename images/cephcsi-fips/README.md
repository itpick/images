# cephcsi-fips

CephCSI is the Container Storage Interface (CSI) driver for Ceph, providing support for RBD and CephFS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cephcsi-fips

# Load into Docker
nix build .#load-cephcsi-fips-to-docker && ./result/bin/load-cephcsi-fips-to-docker
```
