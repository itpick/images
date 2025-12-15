# geoserver

GeoServer is an open source Java-based server that allows you to share, process, and edit geospatial data. It implements industry-standard OGC protocols including WMS (Web Map Service), WFS (Web Feature Service), and WCS (Web Coverage Service) for serving maps and spatial data to various clients

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#geoserver

# Load into Docker
nix build .#load-geoserver-to-docker && ./result/bin/load-geoserver-to-docker
```
