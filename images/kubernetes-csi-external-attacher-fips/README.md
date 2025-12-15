# kubernetes-csi-external-attacher-fips

Chainguard image for kubernetes-csi/external-attacher. Watches Kubernetes VolumeAttachment objects and triggers ControllerPublish/Unpublish against a CSI endpoint

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-external-attacher-fips

# Load into Docker
nix build .#load-kubernetes-csi-external-attacher-fips-to-docker && ./result/bin/load-kubernetes-csi-external-attacher-fips-to-docker
```
