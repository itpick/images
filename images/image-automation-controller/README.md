# image-automation-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#image-automation-controller

# Load into Docker
nix build .#load-image-automation-controller-to-docker && ./result/bin/load-image-automation-controller-to-docker
```
