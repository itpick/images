# osquery

## Image Size

| Type | Size |
|------|------|
| Compressed | 341.37 MB |
| Uncompressed | ~853.42 MB |

## Usage

```bash
# Build the image
nix build .#osquery

# Load into Docker
nix build .#load-osquery-to-docker && ./result/bin/load-osquery-to-docker
```
