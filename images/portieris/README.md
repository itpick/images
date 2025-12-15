# portieris

A Kubernetes Admission Controller for verifying image trust

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#portieris

# Load into Docker
nix build .#load-portieris-to-docker && ./result/bin/load-portieris-to-docker
```
