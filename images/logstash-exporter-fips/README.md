# logstash-exporter-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#logstash-exporter-fips

# Load into Docker
nix build .#load-logstash-exporter-fips-to-docker && ./result/bin/load-logstash-exporter-fips-to-docker
```
