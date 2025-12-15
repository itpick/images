# qdrant

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#qdrant

# Load into Docker
nix build .#load-qdrant-to-docker && ./result/bin/load-qdrant-to-docker
```
