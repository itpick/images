# grafana-grafonnet

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grafana-grafonnet

# Load into Docker
nix build .#load-grafana-grafonnet-to-docker && ./result/bin/load-grafana-grafonnet-to-docker
```
