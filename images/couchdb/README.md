# couchdb

## Image Size

| Type | Size |
|------|------|
| Compressed | 407.07 MB |
| Uncompressed | ~1017.69 MB |

## Usage

```bash
# Build the image
nix build .#couchdb

# Load into Docker
nix build .#load-couchdb-to-docker && ./result/bin/load-couchdb-to-docker
```
