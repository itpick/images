# rancher-fleet-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-fleet-controller

# Load into Docker
nix build .#load-rancher-fleet-controller-to-docker && ./result/bin/load-rancher-fleet-controller-to-docker
```
