# secretgen-controller

secretgen-controller provides CRDs to specify what secrets need to be on Kubernetes cluster (to be generated or not)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#secretgen-controller

# Load into Docker
nix build .#load-secretgen-controller-to-docker && ./result/bin/load-secretgen-controller-to-docker
```
