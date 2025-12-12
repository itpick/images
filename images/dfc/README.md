# dfc

## Image Size

| Type | Size |
|------|------|
| Compressed | 90.64 MB |
| Uncompressed | ~226.60 MB |

## Usage

```bash
# Build the image
nix build .#dfc

# Load into Docker
nix build .#load-dfc-to-docker && ./result/bin/load-dfc-to-docker
```
