# tileserver-gl-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tileserver-gl-fips

# Load into Docker
nix build .#load-tileserver-gl-fips-to-docker && ./result/bin/load-tileserver-gl-fips-to-docker
```
