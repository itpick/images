# rstudio

Minimal RStudio container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rstudio

# Load into Docker
nix build .#load-rstudio-to-docker && ./result/bin/load-rstudio-to-docker
```
