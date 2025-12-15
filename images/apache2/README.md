# apache2

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache2

# Load into Docker
nix build .#load-apache2-to-docker && ./result/bin/load-apache2-to-docker
```
