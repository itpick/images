# kyverno-policy-reporter-plugins-trivy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-policy-reporter-plugins-trivy

# Load into Docker
nix build .#load-kyverno-policy-reporter-plugins-trivy-to-docker && ./result/bin/load-kyverno-policy-reporter-plugins-trivy-to-docker
```
