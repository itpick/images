# httpd-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#httpd-fips

# Load into Docker
nix build .#load-httpd-fips-to-docker && ./result/bin/load-httpd-fips-to-docker
```
