# nano

## Image Size

| Type | Size |
|------|------|
| Compressed | 109.59 MB |
| Uncompressed | ~273.97 MB |

## Usage

```bash
# Build the image
nix build .#nano

# Load into Docker
nix build .#load-nano-to-docker && ./result/bin/load-nano-to-docker
```
