# tensorflow-gpu-jupyter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tensorflow-gpu-jupyter

# Load into Docker
nix build .#load-tensorflow-gpu-jupyter-to-docker && ./result/bin/load-tensorflow-gpu-jupyter-to-docker
```
