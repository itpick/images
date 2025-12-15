# rekor-fips-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rekor-fips-cli

# Load into Docker
nix build .#load-rekor-fips-cli-to-docker && ./result/bin/load-rekor-fips-cli-to-docker
```
