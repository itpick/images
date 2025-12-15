# redis-sentinel

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-sentinel

# Load into Docker
nix build .#load-redis-sentinel-to-docker && ./result/bin/load-redis-sentinel-to-docker
```
