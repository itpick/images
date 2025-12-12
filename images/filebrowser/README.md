# filebrowser

## Image Size

| Type | Size |
|------|------|
| Compressed | 134.13 MB |
| Uncompressed | ~335.33 MB |

## Usage

```bash
# Build the image
nix build .#filebrowser

# Load into Docker
nix build .#load-filebrowser-to-docker && ./result/bin/load-filebrowser-to-docker
```
