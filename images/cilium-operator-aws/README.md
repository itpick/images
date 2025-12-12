# cilium-operator-aws

Cilium is an open source, cloud native solution for providing, securing, and observing network connectivity between workloads using eBPF

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 21s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 298.25 MB |
| Uncompressed | ~745.63 MB |

## Usage

```bash
# Build the image
nix build .#cilium-operator-aws

# Load into Docker
nix build .#load-cilium-operator-aws-to-docker && ./result/bin/load-cilium-operator-aws-to-docker
```
