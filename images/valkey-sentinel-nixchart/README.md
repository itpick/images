# valkey-sentinel-nixchart

Valkey is an open source, in-memory data store used by millions of developers as a cache, vector database, document database, streaming engine, and message broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#valkey-sentinel-nixchart

# Load into Docker
nix build .#load-valkey-sentinel-nixchart-to-docker && ./result/bin/load-valkey-sentinel-nixchart-to-docker
```
