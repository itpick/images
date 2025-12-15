# clickhouse-keeper

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clickhouse-keeper

# Load into Docker
nix build .#load-clickhouse-keeper-to-docker && ./result/bin/load-clickhouse-keeper-to-docker
```
