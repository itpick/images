# logstash-nixchart

Logstash dynamically ingests, transforms, and ships your data regardless of format or complexity

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#logstash-nixchart

# Load into Docker
nix build .#load-logstash-nixchart-to-docker && ./result/bin/load-logstash-nixchart-to-docker
```
