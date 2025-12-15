# nats-box-fips

A lightweight container with NATS utilities(FIPS Compliant)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nats-box-fips

# Load into Docker
nix build .#load-nats-box-fips-to-docker && ./result/bin/load-nats-box-fips-to-docker
```
