# k8s-mig-manager

MIG Partition Editor for NVIDIA GPUs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8s-mig-manager

# Load into Docker
nix build .#load-k8s-mig-manager-to-docker && ./result/bin/load-k8s-mig-manager-to-docker
```
