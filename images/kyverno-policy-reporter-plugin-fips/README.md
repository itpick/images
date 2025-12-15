# kyverno-policy-reporter-plugin-fips

Monitoring and Observability Tool for the PolicyReport CRD with an optional UI

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-policy-reporter-plugin-fips

# Load into Docker
nix build .#load-kyverno-policy-reporter-plugin-fips-to-docker && ./result/bin/load-kyverno-policy-reporter-plugin-fips-to-docker
```
