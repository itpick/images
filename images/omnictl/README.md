# omnictl

## Image Size

| Type | Size |
|------|------|
| Compressed | 174.91 MB |
| Uncompressed | ~437.28 MB |

## Usage

```bash
# Build the image
nix build .#omnictl

# Load into Docker
nix build .#load-omnictl-to-docker && ./result/bin/load-omnictl-to-docker
```
