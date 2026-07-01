# git-nixchart-fips

A minimal Git image for use with Iamguarded charts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#git-nixchart-fips

# Load into Docker
nix build .#load-git-nixchart-fips-to-docker && ./result/bin/load-git-nixchart-fips-to-docker
```
