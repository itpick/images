# knative-eventing-webhook

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-webhook

# Load into Docker
nix build .#load-knative-eventing-webhook-to-docker && ./result/bin/load-knative-eventing-webhook-to-docker
```
