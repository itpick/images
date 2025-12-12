# frr

## Image Size

| Type | Size |
|------|------|
| Compressed | 463.21 MB |
| Uncompressed | ~1.13 GB |

## Usage

```bash
# Build the image
nix build .#frr

# Load into Docker
nix build .#load-frr-to-docker && ./result/bin/load-frr-to-docker
```
