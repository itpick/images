# wavefront-collector-for-kubernetes

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wavefront-collector-for-kubernetes

# Load into Docker
nix build .#load-wavefront-collector-for-kubernetes-to-docker && ./result/bin/load-wavefront-collector-for-kubernetes-to-docker
```
