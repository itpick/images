# kubernetes-event-exporter-iamguarded

IAMGuarded compatible image of Kubernetes Event Exporter for exporting Kubernetes events to various outputs to be used for observability or alerting purposes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-event-exporter-iamguarded

# Load into Docker
nix build .#load-kubernetes-event-exporter-iamguarded-to-docker && ./result/bin/load-kubernetes-event-exporter-iamguarded-to-docker
```
