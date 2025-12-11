# istio-install-cni

Istio is a service mesh that extends Kubernetes to provide traffic management, telemetry, security, and policy for complex deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#istio-install-cni

# Load into Docker
nix build .#load-istio-install-cni-to-docker && ./result/bin/load-istio-install-cni-to-docker
```
