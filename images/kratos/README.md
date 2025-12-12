# kratos

## Image Size

| Type | Size |
|------|------|
| Compressed | 206.78 MB |
| Uncompressed | ~516.96 MB |

## Usage

```bash
# Build the image
nix build .#kratos

# Load into Docker
nix build .#load-kratos-to-docker && ./result/bin/load-kratos-to-docker
```
