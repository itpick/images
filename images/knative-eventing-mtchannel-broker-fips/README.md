# knative-eventing-mtchannel-broker-fips

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-mtchannel-broker-fips

# Load into Docker
nix build .#load-knative-eventing-mtchannel-broker-fips-to-docker && ./result/bin/load-knative-eventing-mtchannel-broker-fips-to-docker
```
