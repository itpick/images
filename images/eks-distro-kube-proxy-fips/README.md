# eks-distro-kube-proxy-fips

An open-source distribution of Kubernetes from AWS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#eks-distro-kube-proxy-fips

# Load into Docker
nix build .#load-eks-distro-kube-proxy-fips-to-docker && ./result/bin/load-eks-distro-kube-proxy-fips-to-docker
```
