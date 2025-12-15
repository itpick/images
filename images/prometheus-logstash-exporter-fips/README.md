# prometheus-logstash-exporter-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-logstash-exporter-fips

# Load into Docker
nix build .#load-prometheus-logstash-exporter-fips-to-docker && ./result/bin/load-prometheus-logstash-exporter-fips-to-docker
```
