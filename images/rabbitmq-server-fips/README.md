# rabbitmq-server-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rabbitmq-server-fips

# Load into Docker
nix build .#load-rabbitmq-server-fips-to-docker && ./result/bin/load-rabbitmq-server-fips-to-docker
```
