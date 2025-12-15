# kubernetes-event-exporter-fips

Minimalist wolfi-based FIPS image of Kubernetes Event Exporter. Exports Kubernetes events to various outputs to be used for observability or alerting purposes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubernetes-event-exporter-fips

# Load into Docker
nix build .#load-kubernetes-event-exporter-fips-to-docker && ./result/bin/load-kubernetes-event-exporter-fips-to-docker
```
