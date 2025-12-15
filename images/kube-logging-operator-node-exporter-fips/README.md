# kube-logging-operator-node-exporter-fips

Custom runner based Prometheus node exporter for kube-logging logging-operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-logging-operator-node-exporter-fips

# Load into Docker
nix build .#load-kube-logging-operator-node-exporter-fips-to-docker && ./result/bin/load-kube-logging-operator-node-exporter-fips-to-docker
```
