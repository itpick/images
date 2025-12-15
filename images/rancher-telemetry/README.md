# rancher-telemetry

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-telemetry

# Load into Docker
nix build .#load-rancher-telemetry-to-docker && ./result/bin/load-rancher-telemetry-to-docker
```
