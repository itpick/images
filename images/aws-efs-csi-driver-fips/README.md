# aws-efs-csi-driver-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-efs-csi-driver-fips

# Load into Docker
nix build .#load-aws-efs-csi-driver-fips-to-docker && ./result/bin/load-aws-efs-csi-driver-fips-to-docker
```
