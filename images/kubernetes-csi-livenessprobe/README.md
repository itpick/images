# kubernetes-csi-livenessprobe

A sidecar container that can be included in a CSI plugin pod to enable integration with Kubernetes Liveness Probe

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-livenessprobe

# Load into Docker
nix build .#load-kubernetes-csi-livenessprobe-to-docker && ./result/bin/load-kubernetes-csi-livenessprobe-to-docker
```
