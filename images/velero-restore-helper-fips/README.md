# velero-restore-helper-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#velero-restore-helper-fips

# Load into Docker
nix build .#load-velero-restore-helper-fips-to-docker && ./result/bin/load-velero-restore-helper-fips-to-docker
```
