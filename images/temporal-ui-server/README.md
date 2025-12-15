# temporal-ui-server

Golang Server for https://github.com/temporalio/ui

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#temporal-ui-server

# Load into Docker
nix build .#load-temporal-ui-server-to-docker && ./result/bin/load-temporal-ui-server-to-docker
```
