# apache-hop

Data orchestration and engineering platform for managing ETL/ELT workflows

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache-hop

# Load into Docker
nix build .#load-apache-hop-to-docker && ./result/bin/load-apache-hop-to-docker
```
