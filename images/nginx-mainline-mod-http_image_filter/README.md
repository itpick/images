# nginx-mainline-mod-http_image_filter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nginx-mainline-mod-http_image_filter

# Load into Docker
nix build .#load-nginx-mainline-mod-http_image_filter-to-docker && ./result/bin/load-nginx-mainline-mod-http_image_filter-to-docker
```
