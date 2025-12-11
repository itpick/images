# grafana-agent-operator

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 7s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#grafana-agent-operator

# Load into Docker
nix build .#load-grafana-agent-operator-to-docker && ./result/bin/load-grafana-agent-operator-to-docker
```
