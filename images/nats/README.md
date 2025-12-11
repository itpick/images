# nats

NATS is a flexible messaging system providing pub/sub, streaming, storage etc

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#nats

# Load into Docker
nix build .#load-nats-to-docker && ./result/bin/load-nats-to-docker
```
