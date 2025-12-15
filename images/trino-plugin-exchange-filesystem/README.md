# trino-plugin-exchange-filesystem

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trino-plugin-exchange-filesystem

# Load into Docker
nix build .#load-trino-plugin-exchange-filesystem-to-docker && ./result/bin/load-trino-plugin-exchange-filesystem-to-docker
```
