# apache-arrow

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache-arrow

# Load into Docker
nix build .#load-apache-arrow-to-docker && ./result/bin/load-apache-arrow-to-docker
```
