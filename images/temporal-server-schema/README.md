# temporal-server-schema

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#temporal-server-schema

# Load into Docker
nix build .#load-temporal-server-schema-to-docker && ./result/bin/load-temporal-server-schema-to-docker
```
