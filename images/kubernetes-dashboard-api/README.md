# kubernetes-dashboard-api

Stateless Go module, which could be referred to as a Kubernetes API extension

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-dashboard-api

# Load into Docker
nix build .#load-kubernetes-dashboard-api-to-docker && ./result/bin/load-kubernetes-dashboard-api-to-docker
```
