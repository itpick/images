# spire-oidc-discovery-provider-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spire-oidc-discovery-provider-fips

# Load into Docker
nix build .#load-spire-oidc-discovery-provider-fips-to-docker && ./result/bin/load-spire-oidc-discovery-provider-fips-to-docker
```
