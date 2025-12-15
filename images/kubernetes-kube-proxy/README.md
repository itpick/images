# kubernetes-kube-proxy

Production-Grade Container Scheduling and Management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-kube-proxy

# Load into Docker
nix build .#load-kubernetes-kube-proxy-to-docker && ./result/bin/load-kubernetes-kube-proxy-to-docker
```
