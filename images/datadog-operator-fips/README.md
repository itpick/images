# datadog-operator-fips

Kubernetes Operator for Datadog Resources

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#datadog-operator-fips

# Load into Docker
nix build .#load-datadog-operator-fips-to-docker && ./result/bin/load-datadog-operator-fips-to-docker
```
