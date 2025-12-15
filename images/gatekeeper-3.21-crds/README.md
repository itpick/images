# gatekeeper-3.21-crds

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gatekeeper-3.21-crds

# Load into Docker
nix build .#load-gatekeeper-3.21-crds-to-docker && ./result/bin/load-gatekeeper-3.21-crds-to-docker
```
