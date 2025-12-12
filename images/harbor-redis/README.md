# harbor-redis

## Image Size

| Type | Size |
|------|------|
| Compressed | 276.70 MB |
| Uncompressed | ~691.76 MB |

## Usage

```bash
# Build the image
nix build .#harbor-redis

# Load into Docker
nix build .#load-harbor-redis-to-docker && ./result/bin/load-harbor-redis-to-docker
```
