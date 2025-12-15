# sonobuoy

A diagnostic tool for Kubernetes clusters to run conformance and plugin-based tests

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#sonobuoy

# Load into Docker
nix build .#load-sonobuoy-to-docker && ./result/bin/load-sonobuoy-to-docker
```
