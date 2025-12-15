# tesseract

Minimal image that contains tesseract

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#tesseract

# Load into Docker
nix build .#load-tesseract-to-docker && ./result/bin/load-tesseract-to-docker
```
