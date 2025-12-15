# containers-image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#containers-image

# Load into Docker
nix build .#load-containers-image-to-docker && ./result/bin/load-containers-image-to-docker
```
