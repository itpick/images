# opencost

OpenCost give teams visibility into current and historical Kubernetes and cloud spend and resource allocation

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opencost

# Load into Docker
nix build .#load-opencost-to-docker && ./result/bin/load-opencost-to-docker
```
