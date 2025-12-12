# harbor-db

## Image Size

| Type | Size |
|------|------|
| Compressed | 260.09 MB |
| Uncompressed | ~650.22 MB |

## Usage

```bash
# Build the image
nix build .#harbor-db

# Load into Docker
nix build .#load-harbor-db-to-docker && ./result/bin/load-harbor-db-to-docker
```
