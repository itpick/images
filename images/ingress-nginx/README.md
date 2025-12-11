# ingress-nginx

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 10s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#ingress-nginx

# Load into Docker
nix build .#load-ingress-nginx-to-docker && ./result/bin/load-ingress-nginx-to-docker
```
