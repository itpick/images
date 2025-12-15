# harbor-exporter-fips

A Wolf-based image for Harbor Exporter - application for monitoring harbor deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harbor-exporter-fips

# Load into Docker
nix build .#load-harbor-exporter-fips-to-docker && ./result/bin/load-harbor-exporter-fips-to-docker
```
