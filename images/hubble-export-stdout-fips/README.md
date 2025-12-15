# hubble-export-stdout-fips

FIPS-compliant hubble-export-stdout exports Hubble data to stdout

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#hubble-export-stdout-fips

# Load into Docker
nix build .#load-hubble-export-stdout-fips-to-docker && ./result/bin/load-hubble-export-stdout-fips-to-docker
```
