# tflint

A Pluggable Terraform Linter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tflint

# Load into Docker
nix build .#load-tflint-to-docker && ./result/bin/load-tflint-to-docker
```
