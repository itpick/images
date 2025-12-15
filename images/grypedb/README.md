# grypedb

A Wolfi-powered image for GrypeDB and Vunnel that allows you to create your own Grype DB instances

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#grypedb

# Load into Docker
nix build .#load-grypedb-to-docker && ./result/bin/load-grypedb-to-docker
```
