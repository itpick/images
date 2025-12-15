# proxysql

Minimal image with proxysql

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#proxysql

# Load into Docker
nix build .#load-proxysql-to-docker && ./result/bin/load-proxysql-to-docker
```
