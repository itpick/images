# kserve-rest-proxy

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kserve-rest-proxy

# Load into Docker
nix build .#load-kserve-rest-proxy-to-docker && ./result/bin/load-kserve-rest-proxy-to-docker
```
