# cni-plugins

## Image Size

| Type | Size |
|------|------|
| Compressed | 225.87 MB |
| Uncompressed | ~564.68 MB |

## Usage

```bash
# Build the image
nix build .#cni-plugins

# Load into Docker
nix build .#load-cni-plugins-to-docker && ./result/bin/load-cni-plugins-to-docker
```
