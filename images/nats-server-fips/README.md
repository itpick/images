# nats-server-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nats-server-fips

# Load into Docker
nix build .#load-nats-server-fips-to-docker && ./result/bin/load-nats-server-fips-to-docker
```
