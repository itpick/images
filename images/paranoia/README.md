# paranoia

Minimalist Wolfi-based paranoia image for inspecting certificate authorities in container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#paranoia

# Load into Docker
nix build .#load-paranoia-to-docker && ./result/bin/load-paranoia-to-docker
```
