# httpie

## Image Size

| Type | Size |
|------|------|
| Compressed | 279.33 MB |
| Uncompressed | ~698.34 MB |

## Usage

```bash
# Build the image
nix build .#httpie

# Load into Docker
nix build .#load-httpie-to-docker && ./result/bin/load-httpie-to-docker
```
