# neo4j

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.71 GB |
| Uncompressed | ~4.28 GB |

## Usage

```bash
# Build the image
nix build .#neo4j

# Load into Docker
nix build .#load-neo4j-to-docker && ./result/bin/load-neo4j-to-docker
```
