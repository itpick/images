# step-kms-plugin-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#step-kms-plugin-fips

# Load into Docker
nix build .#load-step-kms-plugin-fips-to-docker && ./result/bin/load-step-kms-plugin-fips-to-docker
```
