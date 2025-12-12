# deck

## Image Size

| Type | Size |
|------|------|
| Compressed | 204.84 MB |
| Uncompressed | ~512.11 MB |

## Usage

```bash
# Build the image
nix build .#deck

# Load into Docker
nix build .#load-deck-to-docker && ./result/bin/load-deck-to-docker
```
