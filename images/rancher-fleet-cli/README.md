# rancher-fleet-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-fleet-cli

# Load into Docker
nix build .#load-rancher-fleet-cli-to-docker && ./result/bin/load-rancher-fleet-cli-to-docker
```
