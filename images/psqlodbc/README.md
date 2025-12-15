# psqlodbc

This image contains psqlodbc drivers for use with unixODBC

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#psqlodbc

# Load into Docker
nix build .#load-psqlodbc-to-docker && ./result/bin/load-psqlodbc-to-docker
```
