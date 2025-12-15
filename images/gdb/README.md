# gdb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gdb

# Load into Docker
nix build .#load-gdb-to-docker && ./result/bin/load-gdb-to-docker
```
