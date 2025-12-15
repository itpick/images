# cilium-agent

Cilium is an open source, cloud native solution for providing, securing, and observing network connectivity between workloads using eBPF

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cilium-agent

# Load into Docker
nix build .#load-cilium-agent-to-docker && ./result/bin/load-cilium-agent-to-docker
```
