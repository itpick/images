# it-tools

## Image Size

| Type | Size |
|------|------|
| Compressed | 72.65 MB |
| Uncompressed | ~181.64 MB |

## Usage

```bash
# Build the image
nix build .#it-tools

# Load into Docker
nix build .#load-it-tools-to-docker && ./result/bin/load-it-tools-to-docker
```
