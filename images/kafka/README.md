# kafka

## Image Size

| Type | Size |
|------|------|
| Compressed | 857.98 MB |
| Uncompressed | ~2.09 GB |

## Usage

```bash
# Build the image
nix build .#kafka

# Load into Docker
nix build .#load-kafka-to-docker && ./result/bin/load-kafka-to-docker
```
