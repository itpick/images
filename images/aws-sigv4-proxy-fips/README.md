# aws-sigv4-proxy-fips

This project signs and proxies HTTP requests with Sigv4

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-sigv4-proxy-fips

# Load into Docker
nix build .#load-aws-sigv4-proxy-fips-to-docker && ./result/bin/load-aws-sigv4-proxy-fips-to-docker
```
