# apache2-utils

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache2-utils

# Load into Docker
nix build .#load-apache2-utils-to-docker && ./result/bin/load-apache2-utils-to-docker
```
