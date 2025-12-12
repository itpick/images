# conduit

## Image Size

| Type | Size |
|------|------|
| Compressed | 415.84 MB |
| Uncompressed | ~1.01 GB |

## Usage

```bash
# Build the image
nix build .#conduit

# Load into Docker
nix build .#load-conduit-to-docker && ./result/bin/load-conduit-to-docker
```
