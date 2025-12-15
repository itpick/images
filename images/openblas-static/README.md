# openblas-static

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openblas-static

# Load into Docker
nix build .#load-openblas-static-to-docker && ./result/bin/load-openblas-static-to-docker
```
