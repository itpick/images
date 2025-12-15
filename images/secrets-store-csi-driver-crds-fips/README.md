# secrets-store-csi-driver-crds-fips

An image to be used as a init container to create the necessary CRDs while deploying the Kubernetes Secrets Store CSI Driver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#secrets-store-csi-driver-crds-fips

# Load into Docker
nix build .#load-secrets-store-csi-driver-crds-fips-to-docker && ./result/bin/load-secrets-store-csi-driver-crds-fips-to-docker
```
