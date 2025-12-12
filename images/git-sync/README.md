# git-sync

## Image Size

| Type | Size |
|------|------|
| Compressed | 569.25 MB |
| Uncompressed | ~1.38 GB |

## Usage

```bash
# Build the image
nix build .#git-sync

# Load into Docker
nix build .#load-git-sync-to-docker && ./result/bin/load-git-sync-to-docker
```
