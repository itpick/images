# crossplane-function-go-templating

This composition function allows you to compose Crossplane resources using Go templates

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-function-go-templating

# Load into Docker
nix build .#load-crossplane-function-go-templating-to-docker && ./result/bin/load-crossplane-function-go-templating-to-docker
```
