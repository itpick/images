# perl

## Image Size

| Type | Size |
|------|------|
| Compressed | 222.40 MB |
| Uncompressed | ~556.00 MB |

## Usage

```bash
# Build the image
nix build .#perl

# Load into Docker
nix build .#load-perl-to-docker && ./result/bin/load-perl-to-docker
```
