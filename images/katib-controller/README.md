# katib-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5m 10s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#katib-controller

# Load into Docker
nix build .#load-katib-controller-to-docker && ./result/bin/load-katib-controller-to-docker
```
