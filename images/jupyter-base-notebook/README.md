# jupyter-base-notebook

Minimal Jupyter base notebook image using pip

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jupyter-base-notebook

# Load into Docker
nix build .#load-jupyter-base-notebook-to-docker && ./result/bin/load-jupyter-base-notebook-to-docker
```
