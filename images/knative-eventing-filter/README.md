# knative-eventing-filter

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-filter

# Load into Docker
nix build .#load-knative-eventing-filter-to-docker && ./result/bin/load-knative-eventing-filter-to-docker
```
