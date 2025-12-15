# kyverno-policy-reporter-plugin-trivy

This Plugin for Policy Reporter brings additional Trivy specific information to the Policy Reporter UI

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-policy-reporter-plugin-trivy

# Load into Docker
nix build .#load-kyverno-policy-reporter-plugin-trivy-to-docker && ./result/bin/load-kyverno-policy-reporter-plugin-trivy-to-docker
```
