# logstash

Logstash is a server-side data processing pipeline that ingests data from multiple sources, transforms it, and sends it to your chosen destination

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#logstash

# Load into Docker
nix build .#load-logstash-to-docker && ./result/bin/load-logstash-to-docker
```
