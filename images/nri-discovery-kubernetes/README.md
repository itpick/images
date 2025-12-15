# nri-discovery-kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-discovery-kubernetes

# Load into Docker
nix build .#load-nri-discovery-kubernetes-to-docker && ./result/bin/load-nri-discovery-kubernetes-to-docker
```
