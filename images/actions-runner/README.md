# actions-runner

actions-runner is a self-hosted application that runs GitHub Actions jobs on your own infrastructure

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#actions-runner

# Load into Docker
nix build .#load-actions-runner-to-docker && ./result/bin/load-actions-runner-to-docker
```
