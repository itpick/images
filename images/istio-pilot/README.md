# istio-pilot

Istio is a service mesh that extends Kubernetes to provide traffic management, telemetry, security, and policy for complex deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 32s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 282.88 MB |
| Uncompressed | ~707.21 MB |

## Usage

```bash
# Build the image
nix build .#istio-pilot

# Load into Docker
nix build .#load-istio-pilot-to-docker && ./result/bin/load-istio-pilot-to-docker
```
