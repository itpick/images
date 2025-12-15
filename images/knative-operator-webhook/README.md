# knative-operator-webhook

Combined operator for Knative

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-operator-webhook

# Load into Docker
nix build .#load-knative-operator-webhook-to-docker && ./result/bin/load-knative-operator-webhook-to-docker
```
