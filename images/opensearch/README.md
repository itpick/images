# opensearch

## Image Size

| Type | Size |
|------|------|
| Compressed | 2.47 GB |
| Uncompressed | ~6.19 GB |

## Usage

```bash
# Build the image
nix build .#opensearch

# Load into Docker
nix build .#load-opensearch-to-docker && ./result/bin/load-opensearch-to-docker
```
