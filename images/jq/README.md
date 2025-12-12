# jq

## Image Size

| Type | Size |
|------|------|
| Compressed | 91.64 MB |
| Uncompressed | ~229.11 MB |

## Usage

```bash
# Build the image
nix build .#jq

# Load into Docker
nix build .#load-jq-to-docker && ./result/bin/load-jq-to-docker
```
