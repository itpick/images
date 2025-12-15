# secrets-store-csi-driver

Minimal image with Kubernetes Secrets Store CSI Driver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#secrets-store-csi-driver

# Load into Docker
nix build .#load-secrets-store-csi-driver-to-docker && ./result/bin/load-secrets-store-csi-driver-to-docker
```
