# crossplane-function-auto-ready

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-function-auto-ready

# Load into Docker
nix build .#load-crossplane-function-auto-ready-to-docker && ./result/bin/load-crossplane-function-auto-ready-to-docker
```
