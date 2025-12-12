# buf

## Image Size

| Type | Size |
|------|------|
| Compressed | 267.68 MB |
| Uncompressed | ~669.20 MB |

## Usage

```bash
# Build the image
nix build .#buf

# Load into Docker
nix build .#load-buf-to-docker && ./result/bin/load-buf-to-docker
```
