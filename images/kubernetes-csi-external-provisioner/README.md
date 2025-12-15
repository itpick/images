# kubernetes-csi-external-provisioner

Sidecar container that watches Kubernetes PersistentVolumeClaim objects and triggers CreateVolume/DeleteVolume against a CSI endpoint

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-external-provisioner

# Load into Docker
nix build .#load-kubernetes-csi-external-provisioner-to-docker && ./result/bin/load-kubernetes-csi-external-provisioner-to-docker
```
