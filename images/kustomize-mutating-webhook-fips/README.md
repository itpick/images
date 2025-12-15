# kustomize-mutating-webhook-fips

A dynamic solution to patch FluxCD Kustomization resources, seamlessly integrating and federating substitution variables across multiple namespaces

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kustomize-mutating-webhook-fips

# Load into Docker
nix build .#load-kustomize-mutating-webhook-fips-to-docker && ./result/bin/load-kustomize-mutating-webhook-fips-to-docker
```
