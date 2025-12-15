# karma-fips

A dashboard for managing alerts from Alertmanager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#karma-fips

# Load into Docker
nix build .#load-karma-fips-to-docker && ./result/bin/load-karma-fips-to-docker
```
