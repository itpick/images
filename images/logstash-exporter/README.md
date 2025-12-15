# logstash-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#logstash-exporter

# Load into Docker
nix build .#load-logstash-exporter-to-docker && ./result/bin/load-logstash-exporter-to-docker
```
