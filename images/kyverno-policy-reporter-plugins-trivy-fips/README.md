# kyverno-policy-reporter-plugins-trivy-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-policy-reporter-plugins-trivy-fips

# Load into Docker
nix build .#load-kyverno-policy-reporter-plugins-trivy-fips-to-docker && ./result/bin/load-kyverno-policy-reporter-plugins-trivy-fips-to-docker
```
