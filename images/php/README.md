# php

Minimalist Wolfi-based PHP images for building and running PHP applications. Includes both dev and fpm variants

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 12s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#php

# Load into Docker
nix build .#load-php-to-docker && ./result/bin/load-php-to-docker
```
