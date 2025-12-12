# authentik

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.55 GB |
| Uncompressed | ~3.88 GB |

## Usage

```bash
# Build the image
nix build .#authentik

# Load into Docker
nix build .#load-authentik-to-docker && ./result/bin/load-authentik-to-docker
```
