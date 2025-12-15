# mlflow-iamguarded

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mlflow-iamguarded

# Load into Docker
nix build .#load-mlflow-iamguarded-to-docker && ./result/bin/load-mlflow-iamguarded-to-docker
```
