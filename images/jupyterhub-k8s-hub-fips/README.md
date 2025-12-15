# jupyterhub-k8s-hub-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jupyterhub-k8s-hub-fips

# Load into Docker
nix build .#load-jupyterhub-k8s-hub-fips-to-docker && ./result/bin/load-jupyterhub-k8s-hub-fips-to-docker
```
