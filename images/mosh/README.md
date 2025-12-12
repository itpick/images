# mosh

## Image Size

| Type | Size |
|------|------|
| Compressed | 236.88 MB |
| Uncompressed | ~592.20 MB |

## Usage

```bash
# Build the image
nix build .#mosh

# Load into Docker
nix build .#load-mosh-to-docker && ./result/bin/load-mosh-to-docker
```
