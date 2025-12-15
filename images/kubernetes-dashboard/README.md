# kubernetes-dashboard

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-dashboard

# Load into Docker
nix build .#load-kubernetes-dashboard-to-docker && ./result/bin/load-kubernetes-dashboard-to-docker
```
