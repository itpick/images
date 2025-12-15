# sriov-network-device-plugin

SRIOV network device plugin for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sriov-network-device-plugin

# Load into Docker
nix build .#load-sriov-network-device-plugin-to-docker && ./result/bin/load-sriov-network-device-plugin-to-docker
```
