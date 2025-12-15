# kuma-coredns

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kuma-coredns

# Load into Docker
nix build .#load-kuma-coredns-to-docker && ./result/bin/load-kuma-coredns-to-docker
```
