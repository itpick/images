# ceph-csi-operator

Operator for Ceph CSI driver management in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ceph-csi-operator

# Load into Docker
nix build .#load-ceph-csi-operator-to-docker && ./result/bin/load-ceph-csi-operator-to-docker
```
