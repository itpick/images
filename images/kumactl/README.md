# kumactl

## Image Size

| Type | Size |
|------|------|
| Compressed | 273.02 MB |
| Uncompressed | ~682.57 MB |

## Usage

```bash
# Build the image
nix build .#kumactl

# Load into Docker
nix build .#load-kumactl-to-docker && ./result/bin/load-kumactl-to-docker
```
