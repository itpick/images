# kube-proxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-proxy

# Load into Docker
nix build .#load-kube-proxy-to-docker && ./result/bin/load-kube-proxy-to-docker
```
