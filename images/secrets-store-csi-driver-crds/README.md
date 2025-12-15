# secrets-store-csi-driver-crds

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#secrets-store-csi-driver-crds

# Load into Docker
nix build .#load-secrets-store-csi-driver-crds-to-docker && ./result/bin/load-secrets-store-csi-driver-crds-to-docker
```
