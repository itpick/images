# redis-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-cli

# Load into Docker
nix build .#load-redis-cli-to-docker && ./result/bin/load-redis-cli-to-docker
```
