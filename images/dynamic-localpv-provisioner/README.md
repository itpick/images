# dynamic-localpv-provisioner

Dynamic Local Volumes for Kubernetes Stateful workloads

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dynamic-localpv-provisioner

# Load into Docker
nix build .#load-dynamic-localpv-provisioner-to-docker && ./result/bin/load-dynamic-localpv-provisioner-to-docker
```
