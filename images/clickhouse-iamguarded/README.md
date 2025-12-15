# clickhouse-iamguarded

Minimal Wolfi-based ClickHouse analytics database image. Clickhouse is the fastest and most resource efficient open-source database for real-time apps and analytics

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#clickhouse-iamguarded

# Load into Docker
nix build .#load-clickhouse-iamguarded-to-docker && ./result/bin/load-clickhouse-iamguarded-to-docker
```
