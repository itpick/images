# k8s-metadata-injection

Kubernetes metadata injection for New Relic APM to make a linkage between APM and Infrastructure data

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k8s-metadata-injection

# Load into Docker
nix build .#load-k8s-metadata-injection-to-docker && ./result/bin/load-k8s-metadata-injection-to-docker
```
