# rancher-ui

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-ui

# Load into Docker
nix build .#load-rancher-ui-to-docker && ./result/bin/load-rancher-ui-to-docker
```
