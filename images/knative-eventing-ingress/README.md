# knative-eventing-ingress

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-ingress

# Load into Docker
nix build .#load-knative-eventing-ingress-to-docker && ./result/bin/load-knative-eventing-ingress-to-docker
```
