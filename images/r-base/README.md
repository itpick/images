# r-base

This image contains the R programming language and environment.It can be used for statistical analysis, machine learning and data visualization

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#r-base

# Load into Docker
nix build .#load-r-base-to-docker && ./result/bin/load-r-base-to-docker
```
