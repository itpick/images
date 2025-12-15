# sealed-secrets-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sealed-secrets-controller

# Load into Docker
nix build .#load-sealed-secrets-controller-to-docker && ./result/bin/load-sealed-secrets-controller-to-docker
```
