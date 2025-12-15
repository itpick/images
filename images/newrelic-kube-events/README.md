# newrelic-kube-events

Minimal newrelic-kube-events container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-kube-events

# Load into Docker
nix build .#load-newrelic-kube-events-to-docker && ./result/bin/load-newrelic-kube-events-to-docker
```
