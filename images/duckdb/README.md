# duckdb

## Image Size

| Type | Size |
|------|------|
| Compressed | 214.79 MB |
| Uncompressed | ~536.99 MB |

## Usage

```bash
# Build the image
nix build .#duckdb

# Load into Docker
nix build .#load-duckdb-to-docker && ./result/bin/load-duckdb-to-docker
```
