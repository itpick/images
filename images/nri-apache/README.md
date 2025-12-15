# nri-apache

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-apache

# Load into Docker
nix build .#load-nri-apache-to-docker && ./result/bin/load-nri-apache-to-docker
```
