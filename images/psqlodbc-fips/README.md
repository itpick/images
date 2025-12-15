# psqlodbc-fips

This image contains psqlodbc drivers for use with unixODBC

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#psqlodbc-fips

# Load into Docker
nix build .#load-psqlodbc-fips-to-docker && ./result/bin/load-psqlodbc-fips-to-docker
```
