# tekton-cli-fips

The Tekton Pipelines CLI project provides a command-line interface (CLI) for interacting with Tekton, an open-source framework for Continuous Integration and Delivery (CI/CD) systems

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-cli-fips

# Load into Docker
nix build .#load-tekton-cli-fips-to-docker && ./result/bin/load-tekton-cli-fips-to-docker
```
