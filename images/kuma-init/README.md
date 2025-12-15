# kuma-init

The universal Envoy service mesh for distributed service connectivity

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kuma-init

# Load into Docker
nix build .#load-kuma-init-to-docker && ./result/bin/load-kuma-init-to-docker
```
