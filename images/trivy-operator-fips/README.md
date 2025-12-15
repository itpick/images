# trivy-operator-fips

A FIPS-compliant container image for Trivy Operator, providing automated security scanning for Kubernetes workloads with enhanced cryptographic compliance

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trivy-operator-fips

# Load into Docker
nix build .#load-trivy-operator-fips-to-docker && ./result/bin/load-trivy-operator-fips-to-docker
```
