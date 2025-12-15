# datadog-operator

Kubernetes Operator for Datadog Resources

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#datadog-operator

# Load into Docker
nix build .#load-datadog-operator-to-docker && ./result/bin/load-datadog-operator-to-docker
```
