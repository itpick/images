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

## Usage

```bash
# Build the image
nix build .#git

# Load into Docker
nix build .#load-git-to-docker && ./result/bin/load-git-to-docker
```
