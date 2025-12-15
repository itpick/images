# couchdb

Apache CouchDB is an open-source, document-oriented NoSQL database implemented in Erlang

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#couchdb

# Load into Docker
nix build .#load-couchdb-to-docker && ./result/bin/load-couchdb-to-docker
```
