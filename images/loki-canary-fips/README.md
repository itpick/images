# loki-canary-fips

This image contains the loki application for log aggregation. loki can be used to stream, aggregate, and query logs from apps and infrastructure

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#loki-canary-fips

# Load into Docker
nix build .#load-loki-canary-fips-to-docker && ./result/bin/load-loki-canary-fips-to-docker
```
