# apache-apisix

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache-apisix

# Load into Docker
nix build .#load-apache-apisix-to-docker && ./result/bin/load-apache-apisix-to-docker
```
