# dragonfly

## Image Size

| Type | Size |
|------|------|
| Compressed | 207.75 MB |
| Uncompressed | ~519.38 MB |

## Usage

```bash
# Build the image
nix build .#dragonfly

# Load into Docker
nix build .#load-dragonfly-to-docker && ./result/bin/load-dragonfly-to-docker
```
