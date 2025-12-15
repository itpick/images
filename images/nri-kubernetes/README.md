# nri-kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-kubernetes

# Load into Docker
nix build .#load-nri-kubernetes-to-docker && ./result/bin/load-nri-kubernetes-to-docker
```
