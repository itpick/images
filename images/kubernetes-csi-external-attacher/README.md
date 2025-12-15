# kubernetes-csi-external-attacher

Chainguard image for kubernetes-csi/external-attacher. Watches Kubernetes VolumeAttachment objects and triggers ControllerPublish/Unpublish against a CSI endpoint

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-external-attacher

# Load into Docker
nix build .#load-kubernetes-csi-external-attacher-to-docker && ./result/bin/load-kubernetes-csi-external-attacher-to-docker
```
