# flink

## Image Size

| Type | Size |
|------|------|
| Compressed | 2.04 GB |
| Uncompressed | ~5.11 GB |

## Usage

```bash
# Build the image
nix build .#flink

# Load into Docker
nix build .#load-flink-to-docker && ./result/bin/load-flink-to-docker
```
