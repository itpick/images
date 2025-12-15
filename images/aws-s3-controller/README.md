# aws-s3-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-s3-controller

# Load into Docker
nix build .#load-aws-s3-controller-to-docker && ./result/bin/load-aws-s3-controller-to-docker
```
