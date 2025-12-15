# nats-top-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nats-top-fips

# Load into Docker
nix build .#load-nats-top-fips-to-docker && ./result/bin/load-nats-top-fips-to-docker
```
