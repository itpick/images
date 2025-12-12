# gitlab

## Image Size

| Type | Size |
|------|------|
| Compressed | 4.17 GB |
| Uncompressed | ~10.44 GB |

## Usage

```bash
# Build the image
nix build .#gitlab

# Load into Docker
nix build .#load-gitlab-to-docker && ./result/bin/load-gitlab-to-docker
```
