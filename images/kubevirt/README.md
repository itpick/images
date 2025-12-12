# kubevirt

## Image Size

| Type | Size |
|------|------|
| Compressed | 211.93 MB |
| Uncompressed | ~529.84 MB |

## Usage

```bash
# Build the image
nix build .#kubevirt

# Load into Docker
nix build .#load-kubevirt-to-docker && ./result/bin/load-kubevirt-to-docker
```
