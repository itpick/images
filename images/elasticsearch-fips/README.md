# elasticsearch-fips

Elasticsearch is a distributed search and analytics engine, scalable data store and vector database optimized for speed and relevance on production-scale workloads

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#elasticsearch-fips

# Load into Docker
nix build .#load-elasticsearch-fips-to-docker && ./result/bin/load-elasticsearch-fips-to-docker
```
