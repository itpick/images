# unbound-mailcow-fips

Unbound is a validating, recursive, and caching DNS resolver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#unbound-mailcow-fips

# Load into Docker
nix build .#load-unbound-mailcow-fips-to-docker && ./result/bin/load-unbound-mailcow-fips-to-docker
```
