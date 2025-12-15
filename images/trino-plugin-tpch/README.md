# trino-plugin-tpch

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trino-plugin-tpch

# Load into Docker
nix build .#load-trino-plugin-tpch-to-docker && ./result/bin/load-trino-plugin-tpch-to-docker
```
