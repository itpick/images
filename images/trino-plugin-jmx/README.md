# trino-plugin-jmx

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trino-plugin-jmx

# Load into Docker
nix build .#load-trino-plugin-jmx-to-docker && ./result/bin/load-trino-plugin-jmx-to-docker
```
