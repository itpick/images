# openresty

## Image Size

| Type | Size |
|------|------|
| Compressed | 530.66 MB |
| Uncompressed | ~1.29 GB |

## Usage

```bash
# Build the image
nix build .#openresty

# Load into Docker
nix build .#load-openresty-to-docker && ./result/bin/load-openresty-to-docker
```
