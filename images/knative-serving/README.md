# knative-serving

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-serving

# Load into Docker
nix build .#load-knative-serving-to-docker && ./result/bin/load-knative-serving-to-docker
```
