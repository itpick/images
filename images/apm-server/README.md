# apm-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apm-server

# Load into Docker
nix build .#load-apm-server-to-docker && ./result/bin/load-apm-server-to-docker
```
