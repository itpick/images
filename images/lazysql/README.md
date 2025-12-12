# lazysql

## Image Size

| Type | Size |
|------|------|
| Compressed | 120.58 MB |
| Uncompressed | ~301.46 MB |

## Usage

```bash
# Build the image
nix build .#lazysql

# Load into Docker
nix build .#load-lazysql-to-docker && ./result/bin/load-lazysql-to-docker
```
