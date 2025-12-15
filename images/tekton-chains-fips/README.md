# tekton-chains-fips

Tekton Chains is a Kubernetes Custom Resource Definition (CRD) controller that allows you to manage your supply chain security in Tekton

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-chains-fips

# Load into Docker
nix build .#load-tekton-chains-fips-to-docker && ./result/bin/load-tekton-chains-fips-to-docker
```
