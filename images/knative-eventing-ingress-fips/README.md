# knative-eventing-ingress-fips

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-ingress-fips

# Load into Docker
nix build .#load-knative-eventing-ingress-fips-to-docker && ./result/bin/load-knative-eventing-ingress-fips-to-docker
```
