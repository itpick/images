# gha-runner-scale-set-controller

Kubernetes controller for GitHub Actions self-hosted runners

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gha-runner-scale-set-controller

# Load into Docker
nix build .#load-gha-runner-scale-set-controller-to-docker && ./result/bin/load-gha-runner-scale-set-controller-to-docker
```
