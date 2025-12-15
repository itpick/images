# tekton-sidecarlogresults

Tekton provides a cloud-native Pipeline resource, mainly intended for CI/CD use cases

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-sidecarlogresults

# Load into Docker
nix build .#load-tekton-sidecarlogresults-to-docker && ./result/bin/load-tekton-sidecarlogresults-to-docker
```
