# openvscode-server

## Image Size

| Type | Size |
|------|------|
| Compressed | 453.86 MB |
| Uncompressed | ~1.10 GB |

## Usage

```bash
# Build the image
nix build .#openvscode-server

# Load into Docker
nix build .#load-openvscode-server-to-docker && ./result/bin/load-openvscode-server-to-docker
```
