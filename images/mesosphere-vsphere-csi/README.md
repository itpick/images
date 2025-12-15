# mesosphere-vsphere-csi

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mesosphere-vsphere-csi

# Load into Docker
nix build .#load-mesosphere-vsphere-csi-to-docker && ./result/bin/load-mesosphere-vsphere-csi-to-docker
```
