# git-lfs-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#git-lfs-fips

# Load into Docker
nix build .#load-git-lfs-fips-to-docker && ./result/bin/load-git-lfs-fips-to-docker
```
