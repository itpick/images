# chrony

## Image Size

| Type | Size |
|------|------|
| Compressed | 120.03 MB |
| Uncompressed | ~300.08 MB |

## Usage

```bash
# Build the image
nix build .#chrony

# Load into Docker
nix build .#load-chrony-to-docker && ./result/bin/load-chrony-to-docker
```
