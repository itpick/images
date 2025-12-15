# ceph-csi-operator-fips

Operator for Ceph CSI driver management in Kubernetes (FIPS)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ceph-csi-operator-fips

# Load into Docker
nix build .#load-ceph-csi-operator-fips-to-docker && ./result/bin/load-ceph-csi-operator-fips-to-docker
```
