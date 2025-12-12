# kind

## Image Size

| Type | Size |
|------|------|
| Compressed | 69.27 MB |
| Uncompressed | ~173.18 MB |

## Usage

```bash
# Build the image
nix build .#kind

# Load into Docker
nix build .#load-kind-to-docker && ./result/bin/load-kind-to-docker
```
