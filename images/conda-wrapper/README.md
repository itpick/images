# conda-wrapper

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#conda-wrapper

# Load into Docker
nix build .#load-conda-wrapper-to-docker && ./result/bin/load-conda-wrapper-to-docker
```
