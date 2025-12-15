# node-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#node-exporter

# Load into Docker
nix build .#load-node-exporter-to-docker && ./result/bin/load-node-exporter-to-docker
```
