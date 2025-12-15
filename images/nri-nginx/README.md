# nri-nginx

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-nginx

# Load into Docker
nix build .#load-nri-nginx-to-docker && ./result/bin/load-nri-nginx-to-docker
```
