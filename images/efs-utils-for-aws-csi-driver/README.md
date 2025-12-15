# efs-utils-for-aws-csi-driver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#efs-utils-for-aws-csi-driver

# Load into Docker
nix build .#load-efs-utils-for-aws-csi-driver-to-docker && ./result/bin/load-efs-utils-for-aws-csi-driver-to-docker
```
