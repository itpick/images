# spicedb-fips

This is the FIPS-compliant variant of Spice db an open-source authorization database inspired by Google's Zanzibar, providing scalable and fine-grained access control for applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spicedb-fips

# Load into Docker
nix build .#load-spicedb-fips-to-docker && ./result/bin/load-spicedb-fips-to-docker
```
