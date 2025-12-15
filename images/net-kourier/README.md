# net-kourier

Knative Ingress implementation using Envoy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#net-kourier

# Load into Docker
nix build .#load-net-kourier-to-docker && ./result/bin/load-net-kourier-to-docker
```
