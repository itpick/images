# temporal-sql-tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#temporal-sql-tool

# Load into Docker
nix build .#load-temporal-sql-tool-to-docker && ./result/bin/load-temporal-sql-tool-to-docker
```
