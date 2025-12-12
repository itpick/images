# bat

## Image Size

| Type | Size |
|------|------|
| Compressed | 125.55 MB |
| Uncompressed | ~313.87 MB |

## Usage

```bash
# Build the image
nix build .#bat

# Load into Docker
nix build .#load-bat-to-docker && ./result/bin/load-bat-to-docker
```
