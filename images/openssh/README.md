# openssh

## Image Size

| Type | Size |
|------|------|
| Compressed | 147.73 MB |
| Uncompressed | ~369.33 MB |

## Usage

```bash
# Build the image
nix build .#openssh

# Load into Docker
nix build .#load-openssh-to-docker && ./result/bin/load-openssh-to-docker
```
