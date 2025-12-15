# temporal-server

Minimal image for Temporal, a durable execution platform that handles intermittent failures and retries failed operations

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#temporal-server

# Load into Docker
nix build .#load-temporal-server-to-docker && ./result/bin/load-temporal-server-to-docker
```
