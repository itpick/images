# k8s_gateway

A CoreDNS plugin to resolve all types of external Kubernetes resources

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8s_gateway

# Load into Docker
nix build .#load-k8s_gateway-to-docker && ./result/bin/load-k8s_gateway-to-docker
```
