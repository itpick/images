# image-reflector-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#image-reflector-controller

# Load into Docker
nix build .#load-image-reflector-controller-to-docker && ./result/bin/load-image-reflector-controller-to-docker
```
