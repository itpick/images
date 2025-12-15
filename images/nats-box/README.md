# nats-box

A lightweight container with NATS utilities

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nats-box

# Load into Docker
nix build .#load-nats-box-to-docker && ./result/bin/load-nats-box-to-docker
```
