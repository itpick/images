# kubeseal

## Image Size

| Type | Size |
|------|------|
| Compressed | 163.53 MB |
| Uncompressed | ~408.84 MB |

## Usage

```bash
# Build the image
nix build .#kubeseal

# Load into Docker
nix build .#load-kubeseal-to-docker && ./result/bin/load-kubeseal-to-docker
```
