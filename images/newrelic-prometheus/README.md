# newrelic-prometheus

Minimal newrelic-prometheus container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-prometheus

# Load into Docker
nix build .#load-newrelic-prometheus-to-docker && ./result/bin/load-newrelic-prometheus-to-docker
```
