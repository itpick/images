# gpgv-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpgv-fips

# Load into Docker
nix build .#load-gpgv-fips-to-docker && ./result/bin/load-gpgv-fips-to-docker
```
