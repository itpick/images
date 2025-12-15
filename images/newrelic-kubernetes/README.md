# newrelic-kubernetes

Minimal newrelic-kubernetes container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-kubernetes

# Load into Docker
nix build .#load-newrelic-kubernetes-to-docker && ./result/bin/load-newrelic-kubernetes-to-docker
```
