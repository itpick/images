# newrelic-k8s-metadata-injection-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-k8s-metadata-injection-fips

# Load into Docker
nix build .#load-newrelic-k8s-metadata-injection-fips-to-docker && ./result/bin/load-newrelic-k8s-metadata-injection-fips-to-docker
```
