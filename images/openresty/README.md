# openresty

OpenResty is a high Performance Web Platform Based on Nginx and LuaJIT

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openresty

# Load into Docker
nix build .#load-openresty-to-docker && ./result/bin/load-openresty-to-docker
```
