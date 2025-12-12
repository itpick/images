# clickhouse

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.88 GB |
| Uncompressed | ~4.71 GB |

## Usage

```bash
# Build the image
nix build .#clickhouse

# Load into Docker
nix build .#load-clickhouse-to-docker && ./result/bin/load-clickhouse-to-docker
```
