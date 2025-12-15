# configurable-http-proxy

configurable-http-proxy provides you with a way to update and manage a proxy table using a command line interface or REST API

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#configurable-http-proxy

# Load into Docker
nix build .#load-configurable-http-proxy-to-docker && ./result/bin/load-configurable-http-proxy-to-docker
```
