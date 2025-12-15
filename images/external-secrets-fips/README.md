# external-secrets-fips

Fetches secrets from external systems and exposes them as Kubernetes Secrets

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#external-secrets-fips

# Load into Docker
nix build .#load-external-secrets-fips-to-docker && ./result/bin/load-external-secrets-fips-to-docker
```
