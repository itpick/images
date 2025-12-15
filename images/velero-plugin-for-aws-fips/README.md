# velero-plugin-for-aws-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#velero-plugin-for-aws-fips

# Load into Docker
nix build .#load-velero-plugin-for-aws-fips-to-docker && ./result/bin/load-velero-plugin-for-aws-fips-to-docker
```
