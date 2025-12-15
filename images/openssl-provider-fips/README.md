# openssl-provider-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openssl-provider-fips

# Load into Docker
nix build .#load-openssl-provider-fips-to-docker && ./result/bin/load-openssl-provider-fips-to-docker
```
