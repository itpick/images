# eks-distro-kube-scheduler

An open-source distribution of Kubernetes from AWS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#eks-distro-kube-scheduler

# Load into Docker
nix build .#load-eks-distro-kube-scheduler-to-docker && ./result/bin/load-eks-distro-kube-scheduler-to-docker
```
