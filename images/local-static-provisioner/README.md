# local-static-provisioner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#local-static-provisioner

# Load into Docker
nix build .#load-local-static-provisioner-to-docker && ./result/bin/load-local-static-provisioner-to-docker
```
