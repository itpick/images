# opentofu

OpenTofu is an open-source infrastructure as code tool that allows you to declaratively manage your cloud infrastructure. OpenTofu is a fork of Terraform managed by the Linux Foundation

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#opentofu

# Load into Docker
nix build .#load-opentofu-to-docker && ./result/bin/load-opentofu-to-docker
```
