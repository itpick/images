# aws-efs-csi-driver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-efs-csi-driver

# Load into Docker
nix build .#load-aws-efs-csi-driver-to-docker && ./result/bin/load-aws-efs-csi-driver-to-docker
```
