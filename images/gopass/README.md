# gopass

## Image Size

| Type | Size |
|------|------|
| Compressed | 456.51 MB |
| Uncompressed | ~1.11 GB |

## Usage

```bash
# Build the image
nix build .#gopass

# Load into Docker
nix build .#load-gopass-to-docker && ./result/bin/load-gopass-to-docker
```
