# git-sync

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#git-sync

# Load into Docker
nix build .#load-git-sync-to-docker && ./result/bin/load-git-sync-to-docker
```
