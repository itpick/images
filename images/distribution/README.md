# distribution

## Image Size

| Type | Size |
|------|------|
| Compressed | 217.31 MB |
| Uncompressed | ~543.28 MB |

## Usage

```bash
# Build the image
nix build .#distribution

# Load into Docker
nix build .#load-distribution-to-docker && ./result/bin/load-distribution-to-docker
```
