# cert-manager-csi-driver

A Kubernetes CSI driver that automatically mounts signed certificates to Pods using ephemeral volumes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cert-manager-csi-driver

# Load into Docker
nix build .#load-cert-manager-csi-driver-to-docker && ./result/bin/load-cert-manager-csi-driver-to-docker
```
