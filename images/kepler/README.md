# kepler

## Image Size

| Type | Size |
|------|------|
| Compressed | 143.89 MB |
| Uncompressed | ~359.73 MB |

## Usage

```bash
# Build the image
nix build .#kepler

# Load into Docker
nix build .#load-kepler-to-docker && ./result/bin/load-kepler-to-docker
```
