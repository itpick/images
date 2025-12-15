# superset

A minimal, wolfi-based image for Apache Superset. Apache Supersetis a Data Visualization and Data Exploration Platform

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#superset

# Load into Docker
nix build .#load-superset-to-docker && ./result/bin/load-superset-to-docker
```
