# trino-plugin-memory

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trino-plugin-memory

# Load into Docker
nix build .#load-trino-plugin-memory-to-docker && ./result/bin/load-trino-plugin-memory-to-docker
```
