# openfga

## Image Size

| Type | Size |
|------|------|
| Compressed | 223.06 MB |
| Uncompressed | ~557.65 MB |

## Usage

```bash
# Build the image
nix build .#openfga

# Load into Docker
nix build .#load-openfga-to-docker && ./result/bin/load-openfga-to-docker
```
