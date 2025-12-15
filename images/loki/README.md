# loki

This image contains the loki application for log aggregation. loki can be used to stream, aggregate, and query logs from apps and infrastructure

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#loki

# Load into Docker
nix build .#load-loki-to-docker && ./result/bin/load-loki-to-docker
```
