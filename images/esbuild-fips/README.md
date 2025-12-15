# esbuild-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#esbuild-fips

# Load into Docker
nix build .#load-esbuild-fips-to-docker && ./result/bin/load-esbuild-fips-to-docker
```
