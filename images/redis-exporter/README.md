# redis-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#redis-exporter

# Load into Docker
nix build .#load-redis-exporter-to-docker && ./result/bin/load-redis-exporter-to-docker
```
