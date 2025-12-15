# thanos-receive-controller

Kubernetes controller to automatically configure Thanos receive hashrings

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thanos-receive-controller

# Load into Docker
nix build .#load-thanos-receive-controller-to-docker && ./result/bin/load-thanos-receive-controller-to-docker
```
