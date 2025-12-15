# newrelic-k8s-events-forwarder-fips

A FIPS-Compliant & lightweight Kubernetes event forwarder that streams cluster events to New Relic for centralized monitoring and analysis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-k8s-events-forwarder-fips

# Load into Docker
nix build .#load-newrelic-k8s-events-forwarder-fips-to-docker && ./result/bin/load-newrelic-k8s-events-forwarder-fips-to-docker
```
