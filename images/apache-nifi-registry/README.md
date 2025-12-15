# apache-nifi-registry

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache-nifi-registry

# Load into Docker
nix build .#load-apache-nifi-registry-to-docker && ./result/bin/load-apache-nifi-registry-to-docker
```
