# chisel-fips

A fast TCP/UDP tunnel over HTTP

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#chisel-fips

# Load into Docker
nix build .#load-chisel-fips-to-docker && ./result/bin/load-chisel-fips-to-docker
```
