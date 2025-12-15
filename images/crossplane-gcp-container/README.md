# crossplane-gcp-container

Crossplane GCP Providers deliver Kubernetes-native APIs for provisioning and managing Google Cloud resources through Crossplane

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-gcp-container

# Load into Docker
nix build .#load-crossplane-gcp-container-to-docker && ./result/bin/load-crossplane-gcp-container-to-docker
```
