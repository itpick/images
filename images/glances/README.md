# glances

## Image Size

| Type | Size |
|------|------|
| Compressed | 309.07 MB |
| Uncompressed | ~772.69 MB |

## Usage

```bash
# Build the image
nix build .#glances

# Load into Docker
nix build .#load-glances-to-docker && ./result/bin/load-glances-to-docker
```
