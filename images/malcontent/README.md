# malcontent

## Image Size

| Type | Size |
|------|------|
| Compressed | 460.75 MB |
| Uncompressed | ~1.12 GB |

## Usage

```bash
# Build the image
nix build .#malcontent

# Load into Docker
nix build .#load-malcontent-to-docker && ./result/bin/load-malcontent-to-docker
```
