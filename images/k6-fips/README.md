# k6-fips

Load testing tool for testing APIs, microservices, and websites

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k6-fips

# Load into Docker
nix build .#load-k6-fips-to-docker && ./result/bin/load-k6-fips-to-docker
```
