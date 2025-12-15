# k8s-device-plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8s-device-plugin

# Load into Docker
nix build .#load-k8s-device-plugin-to-docker && ./result/bin/load-k8s-device-plugin-to-docker
```
