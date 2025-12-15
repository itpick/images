# postgis

PostGIS extends the capabilities of the PostgreSQL relational database by adding support for storing, indexing, and querying geospatial data

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgis

# Load into Docker
nix build .#load-postgis-to-docker && ./result/bin/load-postgis-to-docker
```
