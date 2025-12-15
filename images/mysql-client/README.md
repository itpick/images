# mysql-client

A simple SQL shell with input line editing capabilities, to interact with MySQL

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mysql-client

# Load into Docker
nix build .#load-mysql-client-to-docker && ./result/bin/load-mysql-client-to-docker
```
