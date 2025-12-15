# flux-cli-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-cli-fips

# Load into Docker
nix build .#load-flux-cli-fips-to-docker && ./result/bin/load-flux-cli-fips-to-docker
```
