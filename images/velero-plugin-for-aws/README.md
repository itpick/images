# velero-plugin-for-aws

Plugins to support Velero on AWS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#velero-plugin-for-aws

# Load into Docker
nix build .#load-velero-plugin-for-aws-to-docker && ./result/bin/load-velero-plugin-for-aws-to-docker
```
