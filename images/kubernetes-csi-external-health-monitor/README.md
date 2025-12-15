# kubernetes-csi-external-health-monitor

CSI External Health Monitor Controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-csi-external-health-monitor

# Load into Docker
nix build .#load-kubernetes-csi-external-health-monitor-to-docker && ./result/bin/load-kubernetes-csi-external-health-monitor-to-docker
```
