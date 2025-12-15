# opentofu-fips

OpenTofu is an open-source infrastructure as code tool that allows you to declaratively manage your cloud infrastructure. OpenTofu is a fork of Terraform managed by the Linux Foundation

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opentofu-fips

# Load into Docker
nix build .#load-opentofu-fips-to-docker && ./result/bin/load-opentofu-fips-to-docker
```
