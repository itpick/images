# lsof

## Image Size

| Type | Size |
|------|------|
| Compressed | 90.87 MB |
| Uncompressed | ~227.17 MB |

## Usage

```bash
# Build the image
nix build .#lsof

# Load into Docker
nix build .#load-lsof-to-docker && ./result/bin/load-lsof-to-docker
```
