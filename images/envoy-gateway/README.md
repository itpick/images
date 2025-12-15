# envoy-gateway

Manages Envoy Proxy as a Standalone or Kubernetes-based Application Gateway

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#envoy-gateway

# Load into Docker
nix build .#load-envoy-gateway-to-docker && ./result/bin/load-envoy-gateway-to-docker
```
