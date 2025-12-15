# kubernetes-csi-node-driver-registrar

Sidecar container that registers a CSI driver with the kubelet using the kubelet plugin registration mechanism

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-node-driver-registrar

# Load into Docker
nix build .#load-kubernetes-csi-node-driver-registrar-to-docker && ./result/bin/load-kubernetes-csi-node-driver-registrar-to-docker
```
