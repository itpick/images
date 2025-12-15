# secrets-store-csi-driver-provider-aws-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#secrets-store-csi-driver-provider-aws-fips

# Load into Docker
nix build .#load-secrets-store-csi-driver-provider-aws-fips-to-docker && ./result/bin/load-secrets-store-csi-driver-provider-aws-fips-to-docker
```
