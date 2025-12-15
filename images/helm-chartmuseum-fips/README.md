# helm-chartmuseum-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#helm-chartmuseum-fips

# Load into Docker
nix build .#load-helm-chartmuseum-fips-to-docker && ./result/bin/load-helm-chartmuseum-fips-to-docker
```
