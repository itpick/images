# tflint-fips

A Pluggable Terraform Linter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tflint-fips

# Load into Docker
nix build .#load-tflint-fips-to-docker && ./result/bin/load-tflint-fips-to-docker
```
