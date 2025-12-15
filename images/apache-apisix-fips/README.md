# apache-apisix-fips

Apache APISIX is a dynamic, real-time, high-performance API Gateway

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache-apisix-fips

# Load into Docker
nix build .#load-apache-apisix-fips-to-docker && ./result/bin/load-apache-apisix-fips-to-docker
```
