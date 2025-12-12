# git

Last changed 2 days ago

FIPS available
Try a starter image for free
docker pull cgr.

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 449.92 MB |
| Uncompressed | ~1.09 GB |

## Usage

```bash
# Build the image
nix build .#git

# Load into Docker
nix build .#load-git-to-docker && ./result/bin/load-git-to-docker
```
