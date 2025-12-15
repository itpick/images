# knative-eventing-jobsink

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-jobsink

# Load into Docker
nix build .#load-knative-eventing-jobsink-to-docker && ./result/bin/load-knative-eventing-jobsink-to-docker
```
