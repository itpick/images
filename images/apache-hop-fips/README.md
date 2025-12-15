# apache-hop-fips

Data orchestration and engineering platform for managing ETL/ELT workflows

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache-hop-fips

# Load into Docker
nix build .#load-apache-hop-fips-to-docker && ./result/bin/load-apache-hop-fips-to-docker
```
