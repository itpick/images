# kiali

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#kiali

# Load into Docker
nix build .#load-kiali-to-docker && ./result/bin/load-kiali-to-docker
```
