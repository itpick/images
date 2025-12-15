# rancher

Complete container management platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher

# Load into Docker
nix build .#load-rancher-to-docker && ./result/bin/load-rancher-to-docker
```
