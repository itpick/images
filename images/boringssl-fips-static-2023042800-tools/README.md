# boringssl-fips-static-2023042800-tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#boringssl-fips-static-2023042800-tools

# Load into Docker
nix build .#load-boringssl-fips-static-2023042800-tools-to-docker && ./result/bin/load-boringssl-fips-static-2023042800-tools-to-docker
```
