# kuma-cp

## Image Size

| Type | Size |
|------|------|
| Compressed | 285.32 MB |
| Uncompressed | ~713.30 MB |

## Usage

```bash
# Build the image
nix build .#kuma-cp

# Load into Docker
nix build .#load-kuma-cp-to-docker && ./result/bin/load-kuma-cp-to-docker
```
