# dart

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.54 GB |
| Uncompressed | ~3.85 GB |

## Usage

```bash
# Build the image
nix build .#dart

# Load into Docker
nix build .#load-dart-to-docker && ./result/bin/load-dart-to-docker
```
