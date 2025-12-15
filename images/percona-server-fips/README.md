# percona-server-fips

Percona Server for MySQL is a free, fully compatible, enhanced, and open source drop-in replacement for any MySQL database. It provides superior performance, scalability, and instrumentation.'

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#percona-server-fips

# Load into Docker
nix build .#load-percona-server-fips-to-docker && ./result/bin/load-percona-server-fips-to-docker
```
