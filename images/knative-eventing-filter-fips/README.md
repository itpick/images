# knative-eventing-filter-fips

Event-driven application platform for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-filter-fips

# Load into Docker
nix build .#load-knative-eventing-filter-fips-to-docker && ./result/bin/load-knative-eventing-filter-fips-to-docker
```
