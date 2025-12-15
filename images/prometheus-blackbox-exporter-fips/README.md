# prometheus-blackbox-exporter-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-blackbox-exporter-fips

# Load into Docker
nix build .#load-prometheus-blackbox-exporter-fips-to-docker && ./result/bin/load-prometheus-blackbox-exporter-fips-to-docker
```
