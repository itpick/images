# pgbouncer

## Image Size

| Type | Size |
|------|------|
| Compressed | 258.64 MB |
| Uncompressed | ~646.61 MB |

## Usage

```bash
# Build the image
nix build .#pgbouncer

# Load into Docker
nix build .#load-pgbouncer-to-docker && ./result/bin/load-pgbouncer-to-docker
```
