# k8s-wait-for

Container image for waiting for a k8s service, job or pods to enter a desired state

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8s-wait-for

# Load into Docker
nix build .#load-k8s-wait-for-to-docker && ./result/bin/load-k8s-wait-for-to-docker
```
