# kopia

## Image Size

| Type | Size |
|------|------|
| Compressed | 199.49 MB |
| Uncompressed | ~498.74 MB |

## Usage

```bash
# Build the image
nix build .#kopia

# Load into Docker
nix build .#load-kopia-to-docker && ./result/bin/load-kopia-to-docker
```
