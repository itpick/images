# postgres-exporter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#postgres-exporter

# Load into Docker
nix build .#load-postgres-exporter-to-docker && ./result/bin/load-postgres-exporter-to-docker
```
