# graphicsmagick

Minimal container image with GraphicsMagick, a collection of tools allowing you to read, write, and manipulate images in a variety of formats

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#graphicsmagick

# Load into Docker
nix build .#load-graphicsmagick-to-docker && ./result/bin/load-graphicsmagick-to-docker
```
