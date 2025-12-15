# knative-serving-1.19-activator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-serving-1.19-activator

# Load into Docker
nix build .#load-knative-serving-1.19-activator-to-docker && ./result/bin/load-knative-serving-1.19-activator-to-docker
```
