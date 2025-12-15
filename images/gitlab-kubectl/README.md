# gitlab-kubectl

kubectl is the official CLI tool for managing Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-kubectl

# Load into Docker
nix build .#load-gitlab-kubectl-to-docker && ./result/bin/load-gitlab-kubectl-to-docker
```
