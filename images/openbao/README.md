# openbao

## Image Size

| Type | Size |
|------|------|
| Compressed | 336.91 MB |
| Uncompressed | ~842.27 MB |

## Usage

```bash
# Build the image
nix build .#openbao

# Load into Docker
nix build .#load-openbao-to-docker && ./result/bin/load-openbao-to-docker
```
