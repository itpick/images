# nats-server-config-reloader

Monitors NATS configuration files and triggers reloads without restarting the server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nats-server-config-reloader

# Load into Docker
nix build .#load-nats-server-config-reloader-to-docker && ./result/bin/load-nats-server-config-reloader-to-docker
```
