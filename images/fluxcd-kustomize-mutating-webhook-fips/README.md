# fluxcd-kustomize-mutating-webhook-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluxcd-kustomize-mutating-webhook-fips

# Load into Docker
nix build .#load-fluxcd-kustomize-mutating-webhook-fips-to-docker && ./result/bin/load-fluxcd-kustomize-mutating-webhook-fips-to-docker
```
