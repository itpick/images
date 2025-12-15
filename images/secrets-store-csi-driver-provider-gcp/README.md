# secrets-store-csi-driver-provider-gcp

Minimal image with the Kubernetes Secrets Store CSI Driver GCP Plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#secrets-store-csi-driver-provider-gcp

# Load into Docker
nix build .#load-secrets-store-csi-driver-provider-gcp-to-docker && ./result/bin/load-secrets-store-csi-driver-provider-gcp-to-docker
```
