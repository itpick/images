# fping

## Image Size

| Type | Size |
|------|------|
| Compressed | 90.53 MB |
| Uncompressed | ~226.34 MB |

## Usage

```bash
# Build the image
nix build .#fping

# Load into Docker
nix build .#load-fping-to-docker && ./result/bin/load-fping-to-docker
```
