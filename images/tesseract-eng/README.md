# tesseract-eng

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tesseract-eng

# Load into Docker
nix build .#load-tesseract-eng-to-docker && ./result/bin/load-tesseract-eng-to-docker
```
