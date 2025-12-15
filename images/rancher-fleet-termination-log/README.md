# rancher-fleet-termination-log

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-fleet-termination-log

# Load into Docker
nix build .#load-rancher-fleet-termination-log-to-docker && ./result/bin/load-rancher-fleet-termination-log-to-docker
```
