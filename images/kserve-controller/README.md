# kserve-controller

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kserve-controller

# Load into Docker
nix build .#load-kserve-controller-to-docker && ./result/bin/load-kserve-controller-to-docker
```
