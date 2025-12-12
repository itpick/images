# k9s

## Image Size

| Type | Size |
|------|------|
| Compressed | 414.28 MB |
| Uncompressed | ~1.01 GB |

## Usage

```bash
# Build the image
nix build .#k9s

# Load into Docker
nix build .#load-k9s-to-docker && ./result/bin/load-k9s-to-docker
```
