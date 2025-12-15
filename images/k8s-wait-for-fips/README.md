# k8s-wait-for-fips

Container image for waiting for a k8s service, job or pods to enter a desired state

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8s-wait-for-fips

# Load into Docker
nix build .#load-k8s-wait-for-fips-to-docker && ./result/bin/load-k8s-wait-for-fips-to-docker
```
