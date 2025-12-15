# tofu-controller-runner

A GitOps OpenTofu and Terraform controller for Flux

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tofu-controller-runner

# Load into Docker
nix build .#load-tofu-controller-runner-to-docker && ./result/bin/load-tofu-controller-runner-to-docker
```
