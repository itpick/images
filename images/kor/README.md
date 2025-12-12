# kor

## Image Size

| Type | Size |
|------|------|
| Compressed | 151.77 MB |
| Uncompressed | ~379.42 MB |

## Usage

```bash
# Build the image
nix build .#kor

# Load into Docker
nix build .#load-kor-to-docker && ./result/bin/load-kor-to-docker
```
