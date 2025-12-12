# mdbook

## Image Size

| Type | Size |
|------|------|
| Compressed | 126.11 MB |
| Uncompressed | ~315.29 MB |

## Usage

```bash
# Build the image
nix build .#mdbook

# Load into Docker
nix build .#load-mdbook-to-docker && ./result/bin/load-mdbook-to-docker
```
