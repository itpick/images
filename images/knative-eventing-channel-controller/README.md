# knative-eventing-channel-controller

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-channel-controller

# Load into Docker
nix build .#load-knative-eventing-channel-controller-to-docker && ./result/bin/load-knative-eventing-channel-controller-to-docker
```
