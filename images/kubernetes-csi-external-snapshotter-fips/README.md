# kubernetes-csi-external-snapshotter-fips

Sidecar container that watches Kubernetes Snapshot CRD objects and triggers CreateSnapshot/DeleteSnapshot against a CSI endpoint. This container image includes the snapshotter, snapshot-controller and snapshot-validation-webhook

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-external-snapshotter-fips

# Load into Docker
nix build .#load-kubernetes-csi-external-snapshotter-fips-to-docker && ./result/bin/load-kubernetes-csi-external-snapshotter-fips-to-docker
```
