# gh

## Image Size

| Type | Size |
|------|------|
| Compressed | 522.17 MB |
| Uncompressed | ~1.27 GB |

## Usage

```bash
# Build the image
nix build .#gh

# Load into Docker
nix build .#load-gh-to-docker && ./result/bin/load-gh-to-docker
```
