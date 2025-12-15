# cloud-provider-gcp-cloud-controller-manager-fips

Kubernetes cloud controller manager for Google Cloud Platform (GCP), managing cloud-specific resources and integrations

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloud-provider-gcp-cloud-controller-manager-fips

# Load into Docker
nix build .#load-cloud-provider-gcp-cloud-controller-manager-fips-to-docker && ./result/bin/load-cloud-provider-gcp-cloud-controller-manager-fips-to-docker
```
