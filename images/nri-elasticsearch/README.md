# nri-elasticsearch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-elasticsearch

# Load into Docker
nix build .#load-nri-elasticsearch-to-docker && ./result/bin/load-nri-elasticsearch-to-docker
```
