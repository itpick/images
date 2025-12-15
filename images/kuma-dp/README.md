# kuma-dp

The universal Envoy service mesh for distributed service connectivity

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kuma-dp

# Load into Docker
nix build .#load-kuma-dp-to-docker && ./result/bin/load-kuma-dp-to-docker
```
