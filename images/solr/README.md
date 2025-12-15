# solr

Solr is an open-source multi-modal search platform built on top of Lucene

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#solr

# Load into Docker
nix build .#load-solr-to-docker && ./result/bin/load-solr-to-docker
```
