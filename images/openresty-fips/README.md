# openresty-fips

OpenResty is a high Performance Web Platform Based on Nginx and LuaJIT

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openresty-fips

# Load into Docker
nix build .#load-openresty-fips-to-docker && ./result/bin/load-openresty-fips-to-docker
```
