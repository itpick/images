# elasticsearch-nixchart

Free and Open Source, Distributed, RESTful Search Engine built with the Apache Lucene library

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#elasticsearch-nixchart

# Load into Docker
nix build .#load-elasticsearch-nixchart-to-docker && ./result/bin/load-elasticsearch-nixchart-to-docker
```
