# kserve-modelmesh-controller

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kserve-modelmesh-controller

# Load into Docker
nix build .#load-kserve-modelmesh-controller-to-docker && ./result/bin/load-kserve-modelmesh-controller-to-docker
```
