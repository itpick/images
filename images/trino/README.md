# trino

Fast distributed SQL query engine for big data analytics that helps you explore your data universe

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trino

# Load into Docker
nix build .#load-trino-to-docker && ./result/bin/load-trino-to-docker
```
