# clickhouse

Clickhouse is the fastest and most resource efficient open-source database for real-time apps and analytics

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 20s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#clickhouse

# Load into Docker
nix build .#load-clickhouse-to-docker && ./result/bin/load-clickhouse-to-docker
```
