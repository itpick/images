# prometheus-admission-webhook

Admission webhook for Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prometheus-admission-webhook

# Load into Docker
nix build .#load-prometheus-admission-webhook-to-docker && ./result/bin/load-prometheus-admission-webhook-to-docker
```
