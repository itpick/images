# rancher-shell

rancher-shell is the kubectl and helm installer image for Rancher

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-shell

# Load into Docker
nix build .#load-rancher-shell-to-docker && ./result/bin/load-rancher-shell-to-docker
```
