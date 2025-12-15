# vertical-pod-autoscaler-admission-controller-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vertical-pod-autoscaler-admission-controller-fips

# Load into Docker
nix build .#load-vertical-pod-autoscaler-admission-controller-fips-to-docker && ./result/bin/load-vertical-pod-autoscaler-admission-controller-fips-to-docker
```
