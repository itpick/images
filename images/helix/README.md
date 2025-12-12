# helix

## Image Size

| Type | Size |
|------|------|
| Compressed | 549.83 MB |
| Uncompressed | ~1.34 GB |

## Usage

```bash
# Build the image
nix build .#helix

# Load into Docker
nix build .#load-helix-to-docker && ./result/bin/load-helix-to-docker
```
