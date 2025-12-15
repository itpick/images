# arangodb-fips

ArangoDB is a native multi-model database with flexible data models for documents, graphs, and key-values. Build high performance applications using a convenient SQL-like query language or JavaScript extensions

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#arangodb-fips

# Load into Docker
nix build .#load-arangodb-fips-to-docker && ./result/bin/load-arangodb-fips-to-docker
```
