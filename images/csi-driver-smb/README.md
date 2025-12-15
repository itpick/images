# csi-driver-smb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#csi-driver-smb

# Load into Docker
nix build .#load-csi-driver-smb-to-docker && ./result/bin/load-csi-driver-smb-to-docker
```
