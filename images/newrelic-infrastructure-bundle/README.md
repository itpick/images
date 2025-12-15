# newrelic-infrastructure-bundle

Minimal newrelic-infrastructure-bundle container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-infrastructure-bundle

# Load into Docker
nix build .#load-newrelic-infrastructure-bundle-to-docker && ./result/bin/load-newrelic-infrastructure-bundle-to-docker
```
