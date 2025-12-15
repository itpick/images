# trivy-operator

The Trivy Operator automatically scans your Kubernetes workloads for security issues and generates security reports as Kubernetes Custom Resources

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trivy-operator

# Load into Docker
nix build .#load-trivy-operator-to-docker && ./result/bin/load-trivy-operator-to-docker
```
