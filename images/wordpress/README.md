# wordpress

Minimalist Wolfi-based WordPress images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wordpress

# Load into Docker
nix build .#load-wordpress-to-docker && ./result/bin/load-wordpress-to-docker
```
