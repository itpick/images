# nri-mysql

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-mysql

# Load into Docker
nix build .#load-nri-mysql-to-docker && ./result/bin/load-nri-mysql-to-docker
```
