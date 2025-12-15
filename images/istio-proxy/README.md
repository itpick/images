# istio-proxy

Istio is a service mesh that extends Kubernetes to provide traffic management, telemetry, security, and policy for complex deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#istio-proxy

# Load into Docker
nix build .#load-istio-proxy-to-docker && ./result/bin/load-istio-proxy-to-docker
```
