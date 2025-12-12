# buildkit

## Image Size

| Type | Size |
|------|------|
| Compressed | 250.12 MB |
| Uncompressed | ~625.30 MB |

## Usage

```bash
# Build the image
nix build .#buildkit

# Load into Docker
nix build .#load-buildkit-to-docker && ./result/bin/load-buildkit-to-docker
```
