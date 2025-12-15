# cilium-operator-aws-fips

Cilium is an open source, cloud native solution for providing, securing, and observing network connectivity between workloads using eBPF

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cilium-operator-aws-fips

# Load into Docker
nix build .#load-cilium-operator-aws-fips-to-docker && ./result/bin/load-cilium-operator-aws-fips-to-docker
```
