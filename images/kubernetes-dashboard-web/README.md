# kubernetes-dashboard-web

Module containing web application written in Angular and Go server with some web-related logic

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-dashboard-web

# Load into Docker
nix build .#load-kubernetes-dashboard-web-to-docker && ./result/bin/load-kubernetes-dashboard-web-to-docker
```
