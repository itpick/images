# pushprox-fips

Minimal FIPS compliant image with PushProx, a proxy to allow Prometheus to scrape through NAT etc

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pushprox-fips

# Load into Docker
nix build .#load-pushprox-fips-to-docker && ./result/bin/load-pushprox-fips-to-docker
```
