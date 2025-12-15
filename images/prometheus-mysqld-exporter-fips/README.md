# prometheus-mysqld-exporter-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-mysqld-exporter-fips

# Load into Docker
nix build .#load-prometheus-mysqld-exporter-fips-to-docker && ./result/bin/load-prometheus-mysqld-exporter-fips-to-docker
```
