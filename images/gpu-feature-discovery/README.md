# gpu-feature-discovery

Minimal gpu-feature-discovery container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpu-feature-discovery

# Load into Docker
nix build .#load-gpu-feature-discovery-to-docker && ./result/bin/load-gpu-feature-discovery-to-docker
```
