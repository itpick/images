# local-volume-provisioner

Static provisioner of local volumes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#local-volume-provisioner

# Load into Docker
nix build .#load-local-volume-provisioner-to-docker && ./result/bin/load-local-volume-provisioner-to-docker
```
