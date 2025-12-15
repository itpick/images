# policy-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#policy-controller

# Load into Docker
nix build .#load-policy-controller-to-docker && ./result/bin/load-policy-controller-to-docker
```
