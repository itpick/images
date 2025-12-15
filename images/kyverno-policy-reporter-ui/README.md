# kyverno-policy-reporter-ui

Monitoring and Observability Tool for the PolicyReport CRD with an optional UI

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-policy-reporter-ui

# Load into Docker
nix build .#load-kyverno-policy-reporter-ui-to-docker && ./result/bin/load-kyverno-policy-reporter-ui-to-docker
```
