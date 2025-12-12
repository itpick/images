# loki-canary

This image contains the loki application for log aggregation. loki can be used to stream, aggregate, and query logs from apps and infrastructure

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.09 GB |
| Uncompressed | ~2.73 GB |

## Usage

```bash
# Build the image
nix build .#loki-canary

# Load into Docker
nix build .#load-loki-canary-to-docker && ./result/bin/load-loki-canary-to-docker
```
