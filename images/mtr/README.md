# mtr

## Image Size

| Type | Size |
|------|------|
| Compressed | 96.47 MB |
| Uncompressed | ~241.17 MB |

## Usage

```bash
# Build the image
nix build .#mtr

# Load into Docker
nix build .#load-mtr-to-docker && ./result/bin/load-mtr-to-docker
```
