# aws-ebs-csi-driver-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-ebs-csi-driver-fips

# Load into Docker
nix build .#load-aws-ebs-csi-driver-fips-to-docker && ./result/bin/load-aws-ebs-csi-driver-fips-to-docker
```
