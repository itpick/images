# prometheus-elasticsearch-exporter-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-elasticsearch-exporter-fips

# Load into Docker
nix build .#load-prometheus-elasticsearch-exporter-fips-to-docker && ./result/bin/load-prometheus-elasticsearch-exporter-fips-to-docker
```
