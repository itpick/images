# apache-tika

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache-tika

# Load into Docker
nix build .#load-apache-tika-to-docker && ./result/bin/load-apache-tika-to-docker
```
