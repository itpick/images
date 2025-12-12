# laravel

## Image Size

| Type | Size |
|------|------|
| Compressed | 551.94 MB |
| Uncompressed | ~1.34 GB |

## Usage

```bash
# Build the image
nix build .#laravel

# Load into Docker
nix build .#load-laravel-to-docker && ./result/bin/load-laravel-to-docker
```
