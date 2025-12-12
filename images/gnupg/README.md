# gnupg

## Image Size

| Type | Size |
|------|------|
| Compressed | 199.55 MB |
| Uncompressed | ~498.88 MB |

## Usage

```bash
# Build the image
nix build .#gnupg

# Load into Docker
nix build .#load-gnupg-to-docker && ./result/bin/load-gnupg-to-docker
```
