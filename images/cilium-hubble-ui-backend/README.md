# cilium-hubble-ui-backend

Cilium is an open source, cloud native solution for providing, securing, and observing network connectivity between workloads using eBPF

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-hubble-ui-backend

# Load into Docker
nix build .#load-cilium-hubble-ui-backend-to-docker && ./result/bin/load-cilium-hubble-ui-backend-to-docker
```
