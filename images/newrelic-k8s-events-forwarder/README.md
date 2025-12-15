# newrelic-k8s-events-forwarder

Minimal newrelic-k8s-events-forwarder container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-k8s-events-forwarder

# Load into Docker
nix build .#load-newrelic-k8s-events-forwarder-to-docker && ./result/bin/load-newrelic-k8s-events-forwarder-to-docker
```
