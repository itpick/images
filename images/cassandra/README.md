# cassandra

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.44 GB |
| Uncompressed | ~3.61 GB |

## Usage

```bash
# Build the image
nix build .#cassandra

# Load into Docker
nix build .#load-cassandra-to-docker && ./result/bin/load-cassandra-to-docker
```
