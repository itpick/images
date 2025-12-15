# cloud-provider-vsphere

Minimal image of the Kubernetes cloud provider interface for vSphere

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloud-provider-vsphere

# Load into Docker
nix build .#load-cloud-provider-vsphere-to-docker && ./result/bin/load-cloud-provider-vsphere-to-docker
```
