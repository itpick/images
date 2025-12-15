# knative-eventing-mtchannel-broker

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-mtchannel-broker

# Load into Docker
nix build .#load-knative-eventing-mtchannel-broker-to-docker && ./result/bin/load-knative-eventing-mtchannel-broker-to-docker
```
