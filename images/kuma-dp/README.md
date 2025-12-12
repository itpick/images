# kuma-dp

## Image Size

| Type | Size |
|------|------|
| Compressed | 244.48 MB |
| Uncompressed | ~611.21 MB |

## Usage

```bash
# Build the image
nix build .#kuma-dp

# Load into Docker
nix build .#load-kuma-dp-to-docker && ./result/bin/load-kuma-dp-to-docker
```
