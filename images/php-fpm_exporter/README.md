# php-fpm_exporter

Minimal php-fpm_exporter Image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#php-fpm_exporter

# Load into Docker
nix build .#load-php-fpm_exporter-to-docker && ./result/bin/load-php-fpm_exporter-to-docker
```
