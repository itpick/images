# weaviate

Minimal container image for running the weaviate vector database

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#weaviate

# Load into Docker
nix build .#load-weaviate-to-docker && ./result/bin/load-weaviate-to-docker
```
