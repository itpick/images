# kubernetes-kube-apiserver-fips

Production-Grade Container Scheduling and Management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-kube-apiserver-fips

# Load into Docker
nix build .#load-kubernetes-kube-apiserver-fips-to-docker && ./result/bin/load-kubernetes-kube-apiserver-fips-to-docker
```
