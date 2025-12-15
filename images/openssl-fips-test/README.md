# openssl-fips-test

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openssl-fips-test

# Load into Docker
nix build .#load-openssl-fips-test-to-docker && ./result/bin/load-openssl-fips-test-to-docker
```
