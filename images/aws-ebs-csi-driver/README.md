# aws-ebs-csi-driver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-ebs-csi-driver

# Load into Docker
nix build .#load-aws-ebs-csi-driver-to-docker && ./result/bin/load-aws-ebs-csi-driver-to-docker
```
