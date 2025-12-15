# knative-operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-operator

# Load into Docker
nix build .#load-knative-operator-to-docker && ./result/bin/load-knative-operator-to-docker
```
