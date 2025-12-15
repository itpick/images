# kubernetes-dashboard-auth

Go module handling authentication to the Kubernetes API

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-dashboard-auth

# Load into Docker
nix build .#load-kubernetes-dashboard-auth-to-docker && ./result/bin/load-kubernetes-dashboard-auth-to-docker
```
