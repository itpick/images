# dgraph

## Image Size

| Type | Size |
|------|------|
| Compressed | 218.06 MB |
| Uncompressed | ~545.15 MB |

## Usage

```bash
# Build the image
nix build .#dgraph

# Load into Docker
nix build .#load-dgraph-to-docker && ./result/bin/load-dgraph-to-docker
```
