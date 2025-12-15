# crossplane-gcp-compute

Crossplane GCP Providers deliver Kubernetes-native APIs for provisioning and managing Google Cloud resources through Crossplane

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-gcp-compute

# Load into Docker
nix build .#load-crossplane-gcp-compute-to-docker && ./result/bin/load-crossplane-gcp-compute-to-docker
```
