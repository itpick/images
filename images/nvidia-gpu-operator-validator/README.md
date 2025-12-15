# nvidia-gpu-operator-validator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nvidia-gpu-operator-validator

# Load into Docker
nix build .#load-nvidia-gpu-operator-validator-to-docker && ./result/bin/load-nvidia-gpu-operator-validator-to-docker
```
