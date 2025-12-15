# cilium-operator-aws

Cilium is an open source, cloud native solution for providing, securing, and observing network connectivity between workloads using eBPF

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cilium-operator-aws

# Load into Docker
nix build .#load-cilium-operator-aws-to-docker && ./result/bin/load-cilium-operator-aws-to-docker
```
