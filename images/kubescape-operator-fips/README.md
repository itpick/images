# kubescape-operator-fips

Minimal Fips image of Kubescape-Operator is an in-cluster component of the Kubescape security platform that orchestrates security scanning and policy enforcement

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubescape-operator-fips

# Load into Docker
nix build .#load-kubescape-operator-fips-to-docker && ./result/bin/load-kubescape-operator-fips-to-docker
```
