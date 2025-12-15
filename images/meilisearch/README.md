# meilisearch

Minimal meilisearch image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#meilisearch

# Load into Docker
nix build .#load-meilisearch-to-docker && ./result/bin/load-meilisearch-to-docker
```
