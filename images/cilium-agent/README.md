# cilium-agent

Cilium is an open source, cloud native solution for providing, securing, and observing network connectivity between workloads using eBPF

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2m 19s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 2.22 GB |
| Uncompressed | ~5.56 GB |

## Usage

```bash
# Build the image
nix build .#cilium-agent

# Load into Docker
nix build .#load-cilium-agent-to-docker && ./result/bin/load-cilium-agent-to-docker
```
