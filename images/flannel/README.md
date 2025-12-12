# flannel

## Image Size

| Type | Size |
|------|------|
| Compressed | 200.03 MB |
| Uncompressed | ~500.07 MB |

## Usage

```bash
# Build the image
nix build .#flannel

# Load into Docker
nix build .#load-flannel-to-docker && ./result/bin/load-flannel-to-docker
```
