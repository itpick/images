# lazysql

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#lazysql

# Load into Docker
nix build .#load-lazysql-to-docker && ./result/bin/load-lazysql-to-docker
```
