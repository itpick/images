# local-path-provisioner

Local Path Provisioner provides a way for the Kubernetes users to utilize the local storage in each node

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#local-path-provisioner

# Load into Docker
nix build .#load-local-path-provisioner-to-docker && ./result/bin/load-local-path-provisioner-to-docker
```
