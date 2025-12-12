# openfortivpn

## Image Size

| Type | Size |
|------|------|
| Compressed | 303.97 MB |
| Uncompressed | ~759.93 MB |

## Usage

```bash
# Build the image
nix build .#openfortivpn

# Load into Docker
nix build .#load-openfortivpn-to-docker && ./result/bin/load-openfortivpn-to-docker
```
