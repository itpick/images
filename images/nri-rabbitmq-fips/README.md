# nri-rabbitmq-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-rabbitmq-fips

# Load into Docker
nix build .#load-nri-rabbitmq-fips-to-docker && ./result/bin/load-nri-rabbitmq-fips-to-docker
```
