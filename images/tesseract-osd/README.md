# tesseract-osd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tesseract-osd

# Load into Docker
nix build .#load-tesseract-osd-to-docker && ./result/bin/load-tesseract-osd-to-docker
```
