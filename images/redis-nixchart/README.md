# redis-nixchart

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-nixchart

# Load into Docker
nix build .#load-redis-nixchart-to-docker && ./result/bin/load-redis-nixchart-to-docker
```
