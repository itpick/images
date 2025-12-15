# conda-base

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#conda-base

# Load into Docker
nix build .#load-conda-base-to-docker && ./result/bin/load-conda-base-to-docker
```
