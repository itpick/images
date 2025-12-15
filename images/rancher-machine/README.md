# rancher-machine

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-machine

# Load into Docker
nix build .#load-rancher-machine-to-docker && ./result/bin/load-rancher-machine-to-docker
```
