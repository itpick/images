# dnsdist

## Image Size

| Type | Size |
|------|------|
| Compressed | 344.15 MB |
| Uncompressed | ~860.38 MB |

## Usage

```bash
# Build the image
nix build .#dnsdist

# Load into Docker
nix build .#load-dnsdist-to-docker && ./result/bin/load-dnsdist-to-docker
```
