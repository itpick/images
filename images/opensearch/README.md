# opensearch

Minimal image with Opensearch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opensearch

# Load into Docker
nix build .#load-opensearch-to-docker && ./result/bin/load-opensearch-to-docker
```
