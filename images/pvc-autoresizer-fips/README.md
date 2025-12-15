# pvc-autoresizer-fips

pvc-autoresizer is a Kubernetes controller that monitors persistent volume claims (PVCs) and automatically resizes them based on usage metrics collected from Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pvc-autoresizer-fips

# Load into Docker
nix build .#load-pvc-autoresizer-fips-to-docker && ./result/bin/load-pvc-autoresizer-fips-to-docker
```
