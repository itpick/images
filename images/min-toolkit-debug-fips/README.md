# min-toolkit-debug-fips

Wolfi container image with some debugging utilities included. Suitable for using as a debugging tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#min-toolkit-debug-fips

# Load into Docker
nix build .#load-min-toolkit-debug-fips-to-docker && ./result/bin/load-min-toolkit-debug-fips-to-docker
```
