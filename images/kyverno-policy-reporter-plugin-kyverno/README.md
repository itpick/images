# kyverno-policy-reporter-plugin-kyverno

This Plugin for Policy Reporter brings additional Kyverno specific information to the Policy Reporter UI

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-policy-reporter-plugin-kyverno

# Load into Docker
nix build .#load-kyverno-policy-reporter-plugin-kyverno-to-docker && ./result/bin/load-kyverno-policy-reporter-plugin-kyverno-to-docker
```
