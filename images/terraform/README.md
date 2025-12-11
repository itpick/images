# terraform

Terraform is an infrastructure as code tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#terraform

# Load into Docker
nix build .#load-terraform-to-docker && ./result/bin/load-terraform-to-docker
```
