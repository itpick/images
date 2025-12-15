# git-iamguarded

A minimal Git image for use with Iamguarded charts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#git-iamguarded

# Load into Docker
nix build .#load-git-iamguarded-to-docker && ./result/bin/load-git-iamguarded-to-docker
```
