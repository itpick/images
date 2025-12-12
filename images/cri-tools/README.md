# cri-tools

## Image Size

| Type | Size |
|------|------|
| Compressed | 207.56 MB |
| Uncompressed | ~518.92 MB |

## Usage

```bash
# Build the image
nix build .#cri-tools

# Load into Docker
nix build .#load-cri-tools-to-docker && ./result/bin/load-cri-tools-to-docker
```
