# PACKAGE_SUMMARY.md

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#PACKAGE_SUMMARY.md

# Load into Docker
nix build .#load-PACKAGE_SUMMARY.md-to-docker && ./result/bin/load-PACKAGE_SUMMARY.md-to-docker
```
