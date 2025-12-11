# external-secrets

Fetches secrets from external systems and exposes them as Kubernetes Secrets

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 38s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#external-secrets

# Load into Docker
nix build .#load-external-secrets-to-docker && ./result/bin/load-external-secrets-to-docker
```
