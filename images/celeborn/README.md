# celeborn

Celeborn is dedicated to improving the efficiency and elasticity of different map-reduce engines and provides an elastic, high-efficient management service for intermediate data including shuffle data, spilled data, result data, etc. Currently, Celeborn is focusing on shuffle data

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#celeborn

# Load into Docker
nix build .#load-celeborn-to-docker && ./result/bin/load-celeborn-to-docker
```
