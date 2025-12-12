# litecli

## Image Size

| Type | Size |
|------|------|
| Compressed | 262.97 MB |
| Uncompressed | ~657.43 MB |

## Usage

```bash
# Build the image
nix build .#litecli

# Load into Docker
nix build .#load-litecli-to-docker && ./result/bin/load-litecli-to-docker
```
