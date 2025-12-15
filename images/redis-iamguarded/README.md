# redis-iamguarded

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-iamguarded

# Load into Docker
nix build .#load-redis-iamguarded-to-docker && ./result/bin/load-redis-iamguarded-to-docker
```
