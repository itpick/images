# temporal-admin-tools-fips

Administrative command-line tools for Temporal workflow management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#temporal-admin-tools-fips

# Load into Docker
nix build .#load-temporal-admin-tools-fips-to-docker && ./result/bin/load-temporal-admin-tools-fips-to-docker
```
