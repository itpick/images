# kuma-cp

The universal Envoy service mesh for distributed service connectivity

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kuma-cp

# Load into Docker
nix build .#load-kuma-cp-to-docker && ./result/bin/load-kuma-cp-to-docker
```
