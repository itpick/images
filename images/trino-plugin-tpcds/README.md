# trino-plugin-tpcds

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trino-plugin-tpcds

# Load into Docker
nix build .#load-trino-plugin-tpcds-to-docker && ./result/bin/load-trino-plugin-tpcds-to-docker
```
