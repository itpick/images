# wave

Wave watches Deployments within a Kubernetes cluster and ensures that each Deployment's Pods always have up to date configuration

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wave

# Load into Docker
nix build .#load-wave-to-docker && ./result/bin/load-wave-to-docker
```
