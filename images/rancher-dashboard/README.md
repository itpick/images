# rancher-dashboard

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-dashboard

# Load into Docker
nix build .#load-rancher-dashboard-to-docker && ./result/bin/load-rancher-dashboard-to-docker
```
