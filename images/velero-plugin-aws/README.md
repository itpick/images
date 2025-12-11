# velero-plugin-aws

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#velero-plugin-aws

# Load into Docker
nix build .#load-velero-plugin-aws-to-docker && ./result/bin/load-velero-plugin-aws-to-docker
```
