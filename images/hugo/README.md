# hugo

This is a minimal Hugo image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#hugo

# Load into Docker
nix build .#load-hugo-to-docker && ./result/bin/load-hugo-to-docker
```
