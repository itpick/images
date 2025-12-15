# nrdot-collector-k8s

New Relic .NET collector for Kubernetes monitoring

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nrdot-collector-k8s

# Load into Docker
nix build .#load-nrdot-collector-k8s-to-docker && ./result/bin/load-nrdot-collector-k8s-to-docker
```
