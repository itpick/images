# hugo

This is a minimal Hugo image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 154.77 MB |
| Uncompressed | ~386.93 MB |

## Usage

```bash
# Build the image
nix build .#hugo

# Load into Docker
nix build .#load-hugo-to-docker && ./result/bin/load-hugo-to-docker
```
