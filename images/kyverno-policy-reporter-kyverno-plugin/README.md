# kyverno-policy-reporter-kyverno-plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-policy-reporter-kyverno-plugin

# Load into Docker
nix build .#load-kyverno-policy-reporter-kyverno-plugin-to-docker && ./result/bin/load-kyverno-policy-reporter-kyverno-plugin-to-docker
```
