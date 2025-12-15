# mesosphere-vsphere-csi-syncer

vSphere storage Container Storage Interface (CSI) plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mesosphere-vsphere-csi-syncer

# Load into Docker
nix build .#load-mesosphere-vsphere-csi-syncer-to-docker && ./result/bin/load-mesosphere-vsphere-csi-syncer-to-docker
```
