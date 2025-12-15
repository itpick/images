# rancher-helm

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-helm

# Load into Docker
nix build .#load-rancher-helm-to-docker && ./result/bin/load-rancher-helm-to-docker
```
