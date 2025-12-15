# git-sync-fips

A sidecar app which clones a git repo and keeps it in sync with the upstream

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#git-sync-fips

# Load into Docker
nix build .#load-git-sync-fips-to-docker && ./result/bin/load-git-sync-fips-to-docker
```
