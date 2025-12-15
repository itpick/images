# knative-eventing-1.19-ingress

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-1.19-ingress

# Load into Docker
nix build .#load-knative-eventing-1.19-ingress-to-docker && ./result/bin/load-knative-eventing-1.19-ingress-to-docker
```
