# configmap-reload-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#configmap-reload-fips

# Load into Docker
nix build .#load-configmap-reload-fips-to-docker && ./result/bin/load-configmap-reload-fips-to-docker
```
