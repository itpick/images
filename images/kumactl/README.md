# kumactl

The universal Envoy service mesh for distributed service connectivity

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kumactl

# Load into Docker
nix build .#load-kumactl-to-docker && ./result/bin/load-kumactl-to-docker
```
