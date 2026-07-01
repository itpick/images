# git-nixchart

A minimal Git image for use with Iamguarded charts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#git-nixchart

# Load into Docker
nix build .#load-git-nixchart-to-docker && ./result/bin/load-git-nixchart-to-docker
```
