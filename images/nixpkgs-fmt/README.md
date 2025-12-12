# nixpkgs-fmt

## Image Size

| Type | Size |
|------|------|
| Compressed | 106.88 MB |
| Uncompressed | ~267.21 MB |

## Usage

```bash
# Build the image
nix build .#nixpkgs-fmt

# Load into Docker
nix build .#load-nixpkgs-fmt-to-docker && ./result/bin/load-nixpkgs-fmt-to-docker
```
