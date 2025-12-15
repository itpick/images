# nist-mip-openssl-provider-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nist-mip-openssl-provider-fips

# Load into Docker
nix build .#load-nist-mip-openssl-provider-fips-to-docker && ./result/bin/load-nist-mip-openssl-provider-fips-to-docker
```
