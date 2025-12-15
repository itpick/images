# tekton-sidecarlogresults-fips

Tekton provides a cloud-native Pipeline resource, mainly intended for CI/CD use cases

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-sidecarlogresults-fips

# Load into Docker
nix build .#load-tekton-sidecarlogresults-fips-to-docker && ./result/bin/load-tekton-sidecarlogresults-fips-to-docker
```
