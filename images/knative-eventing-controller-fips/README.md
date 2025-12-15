# knative-eventing-controller-fips

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-controller-fips

# Load into Docker
nix build .#load-knative-eventing-controller-fips-to-docker && ./result/bin/load-knative-eventing-controller-fips-to-docker
```
