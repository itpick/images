# mesosphere-vsphere-csi-driver

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mesosphere-vsphere-csi-driver

# Load into Docker
nix build .#load-mesosphere-vsphere-csi-driver-to-docker && ./result/bin/load-mesosphere-vsphere-csi-driver-to-docker
```
