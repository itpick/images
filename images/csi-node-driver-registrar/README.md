# csi-node-driver-registrar

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#csi-node-driver-registrar

# Load into Docker
nix build .#load-csi-node-driver-registrar-to-docker && ./result/bin/load-csi-node-driver-registrar-to-docker
```
