# gpu-operator-validator

Minimal gpu-operator-validator container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpu-operator-validator

# Load into Docker
nix build .#load-gpu-operator-validator-to-docker && ./result/bin/load-gpu-operator-validator-to-docker
```
