# sig-storage-local-static-provisioner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sig-storage-local-static-provisioner

# Load into Docker
nix build .#load-sig-storage-local-static-provisioner-to-docker && ./result/bin/load-sig-storage-local-static-provisioner-to-docker
```
