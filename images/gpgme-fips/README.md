# gpgme-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpgme-fips

# Load into Docker
nix build .#load-gpgme-fips-to-docker && ./result/bin/load-gpgme-fips-to-docker
```
