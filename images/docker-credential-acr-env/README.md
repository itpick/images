# docker-credential-acr-env

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-credential-acr-env

# Load into Docker
nix build .#load-docker-credential-acr-env-to-docker && ./result/bin/load-docker-credential-acr-env-to-docker
```
