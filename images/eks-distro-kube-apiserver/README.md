# eks-distro-kube-apiserver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#eks-distro-kube-apiserver

# Load into Docker
nix build .#load-eks-distro-kube-apiserver-to-docker && ./result/bin/load-eks-distro-kube-apiserver-to-docker
```
