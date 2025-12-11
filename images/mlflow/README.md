# mlflow

A minimal, Wolfi-based image for MLflow, an open source platform for the machine learning lifecycle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 20s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#mlflow

# Load into Docker
nix build .#load-mlflow-to-docker && ./result/bin/load-mlflow-to-docker
```
