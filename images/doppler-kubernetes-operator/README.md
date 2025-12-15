# doppler-kubernetes-operator

Automatically sync secrets from Doppler to Kubernetes and auto-reload deployments when secrets change

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#doppler-kubernetes-operator

# Load into Docker
nix build .#load-doppler-kubernetes-operator-to-docker && ./result/bin/load-doppler-kubernetes-operator-to-docker
```
