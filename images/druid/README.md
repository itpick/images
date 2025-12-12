# druid

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.45 GB |
| Uncompressed | ~3.62 GB |

## Usage

```bash
# Build the image
nix build .#druid

# Load into Docker
nix build .#load-druid-to-docker && ./result/bin/load-druid-to-docker
```
