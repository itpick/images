# istio-pilot

Istio is a service mesh that extends Kubernetes to provide traffic management, telemetry, security, and policy for complex deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#istio-pilot

# Load into Docker
nix build .#load-istio-pilot-to-docker && ./result/bin/load-istio-pilot-to-docker
```
