# knative-eventing-1.19-webhook

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-1.19-webhook

# Load into Docker
nix build .#load-knative-eventing-1.19-webhook-to-docker && ./result/bin/load-knative-eventing-1.19-webhook-to-docker
```
