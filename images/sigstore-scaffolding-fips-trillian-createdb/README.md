# sigstore-scaffolding-fips-trillian-createdb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-fips-trillian-createdb

# Load into Docker
nix build .#load-sigstore-scaffolding-fips-trillian-createdb-to-docker && ./result/bin/load-sigstore-scaffolding-fips-trillian-createdb-to-docker
```
