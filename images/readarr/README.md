# readarr

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#readarr

# Load into Docker
nix build .#load-readarr-to-docker && ./result/bin/load-readarr-to-docker
```
