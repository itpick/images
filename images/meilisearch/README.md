# meilisearch

Minimal meilisearch image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 198.46 MB |
| Uncompressed | ~496.15 MB |

## Usage

```bash
# Build the image
nix build .#meilisearch

# Load into Docker
nix build .#load-meilisearch-to-docker && ./result/bin/load-meilisearch-to-docker
```
