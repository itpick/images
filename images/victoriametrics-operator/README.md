# victoriametrics-operator

Kubernetes operator for Victoria Metrics

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#victoriametrics-operator

# Load into Docker
nix build .#load-victoriametrics-operator-to-docker && ./result/bin/load-victoriametrics-operator-to-docker
```
