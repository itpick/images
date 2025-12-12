# jetty

## Image Size

| Type | Size |
|------|------|
| Compressed | 144.12 MB |
| Uncompressed | ~360.31 MB |

## Usage

```bash
# Build the image
nix build .#jetty

# Load into Docker
nix build .#load-jetty-to-docker && ./result/bin/load-jetty-to-docker
```
