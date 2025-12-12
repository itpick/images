# cloudprober

## Image Size

| Type | Size |
|------|------|
| Compressed | 249.03 MB |
| Uncompressed | ~622.59 MB |

## Usage

```bash
# Build the image
nix build .#cloudprober

# Load into Docker
nix build .#load-cloudprober-to-docker && ./result/bin/load-cloudprober-to-docker
```
