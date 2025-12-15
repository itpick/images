# dbgate-fips

FIPS-hardened version of DbGate, a database administration tool for SQL Server, MySQL, PostgreSQL, MongoDB, Redis and SQLite with FIPS 140-2 compliant cryptographic operations

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dbgate-fips

# Load into Docker
nix build .#load-dbgate-fips-to-docker && ./result/bin/load-dbgate-fips-to-docker
```
