# nmap

## Image Size

| Type | Size |
|------|------|
| Compressed | 175.80 MB |
| Uncompressed | ~439.51 MB |

## Usage

```bash
# Build the image
nix build .#nmap

# Load into Docker
nix build .#load-nmap-to-docker && ./result/bin/load-nmap-to-docker
```
