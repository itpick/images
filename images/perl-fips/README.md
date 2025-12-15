# perl-fips

Container image for building Perl applications with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#perl-fips

# Load into Docker
nix build .#load-perl-fips-to-docker && ./result/bin/load-perl-fips-to-docker
```
