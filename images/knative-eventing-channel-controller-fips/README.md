# knative-eventing-channel-controller-fips

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-channel-controller-fips

# Load into Docker
nix build .#load-knative-eventing-channel-controller-fips-to-docker && ./result/bin/load-knative-eventing-channel-controller-fips-to-docker
```
