# mysql-8.4-client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mysql-8.4-client

# Load into Docker
nix build .#load-mysql-8.4-client-to-docker && ./result/bin/load-mysql-8.4-client-to-docker
```
