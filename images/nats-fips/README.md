# nats-fips

NATS is a flexible messaging system providing pub/sub, streaming, storage etc

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nats-fips

# Load into Docker
nix build .#load-nats-fips-to-docker && ./result/bin/load-nats-fips-to-docker
```
