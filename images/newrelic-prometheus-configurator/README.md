# newrelic-prometheus-configurator

Minimal newrelic-prometheus-configurator container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-prometheus-configurator

# Load into Docker
nix build .#load-newrelic-prometheus-configurator-to-docker && ./result/bin/load-newrelic-prometheus-configurator-to-docker
```
