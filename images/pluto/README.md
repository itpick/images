# pluto

A cli tool to help discover deprecated apiVersions in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#pluto

# Load into Docker
nix build .#load-pluto-to-docker && ./result/bin/load-pluto-to-docker
```
