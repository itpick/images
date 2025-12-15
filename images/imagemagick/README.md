# imagemagick

ImageMagick® is a free and open-source software suite, used for editing and manipulating digital images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#imagemagick

# Load into Docker
nix build .#load-imagemagick-to-docker && ./result/bin/load-imagemagick-to-docker
```
