# laravel

Minimalist Wolfi-based Laravel images for developing, building, and running Laravel applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#laravel

# Load into Docker
nix build .#load-laravel-to-docker && ./result/bin/load-laravel-to-docker
```
