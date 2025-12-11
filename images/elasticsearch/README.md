# elasticsearch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#elasticsearch

# Load into Docker
nix build .#load-elasticsearch-to-docker && ./result/bin/load-elasticsearch-to-docker
```
