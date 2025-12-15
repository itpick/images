# fleet-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fleet-server

# Load into Docker
nix build .#load-fleet-server-to-docker && ./result/bin/load-fleet-server-to-docker
```
