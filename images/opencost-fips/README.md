# opencost-fips

OpenCost give teams visibility into current and historical Kubernetes and cloud spend and resource allocation

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opencost-fips

# Load into Docker
nix build .#load-opencost-fips-to-docker && ./result/bin/load-opencost-fips-to-docker
```
