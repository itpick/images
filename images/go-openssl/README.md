# go-openssl

Golang toolchain with golang-fips/go patchset

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#go-openssl

# Load into Docker
nix build .#load-go-openssl-to-docker && ./result/bin/load-go-openssl-to-docker
```
