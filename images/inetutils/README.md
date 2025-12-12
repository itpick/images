# inetutils

## Image Size

| Type | Size |
|------|------|
| Compressed | 114.53 MB |
| Uncompressed | ~286.33 MB |

## Usage

```bash
# Build the image
nix build .#inetutils

# Load into Docker
nix build .#load-inetutils-to-docker && ./result/bin/load-inetutils-to-docker
```
