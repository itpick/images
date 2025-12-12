# onefetch

## Image Size

| Type | Size |
|------|------|
| Compressed | 134.33 MB |
| Uncompressed | ~335.83 MB |

## Usage

```bash
# Build the image
nix build .#onefetch

# Load into Docker
nix build .#load-onefetch-to-docker && ./result/bin/load-onefetch-to-docker
```
