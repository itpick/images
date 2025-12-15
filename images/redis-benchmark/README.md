# redis-benchmark

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-benchmark

# Load into Docker
nix build .#load-redis-benchmark-to-docker && ./result/bin/load-redis-benchmark-to-docker
```
