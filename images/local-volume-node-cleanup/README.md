# local-volume-node-cleanup

The local volume node cleanup controller removes PersistentVolumes and PersistentVolumeClaims that reference deleted Nodes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#local-volume-node-cleanup

# Load into Docker
nix build .#load-local-volume-node-cleanup-to-docker && ./result/bin/load-local-volume-node-cleanup-to-docker
```
