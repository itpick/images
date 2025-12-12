# kcat

## Image Size

| Type | Size |
|------|------|
| Compressed | 351.43 MB |
| Uncompressed | ~878.58 MB |

## Usage

```bash
# Build the image
nix build .#kcat

# Load into Docker
nix build .#load-kcat-to-docker && ./result/bin/load-kcat-to-docker
```
