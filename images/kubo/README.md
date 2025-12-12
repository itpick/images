# kubo

## Image Size

| Type | Size |
|------|------|
| Compressed | 280.67 MB |
| Uncompressed | ~701.68 MB |

## Usage

```bash
# Build the image
nix build .#kubo

# Load into Docker
nix build .#load-kubo-to-docker && ./result/bin/load-kubo-to-docker
```
