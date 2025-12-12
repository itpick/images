# buck2

## Image Size

| Type | Size |
|------|------|
| Compressed | 279.47 MB |
| Uncompressed | ~698.69 MB |

## Usage

```bash
# Build the image
nix build .#buck2

# Load into Docker
nix build .#load-buck2-to-docker && ./result/bin/load-buck2-to-docker
```
