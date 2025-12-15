# nri-redis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-redis

# Load into Docker
nix build .#load-nri-redis-to-docker && ./result/bin/load-nri-redis-to-docker
```
