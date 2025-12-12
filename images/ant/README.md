# ant

## Image Size

| Type | Size |
|------|------|
| Compressed | 698.29 MB |
| Uncompressed | ~1.70 GB |

## Usage

```bash
# Build the image
nix build .#ant

# Load into Docker
nix build .#load-ant-to-docker && ./result/bin/load-ant-to-docker
```
