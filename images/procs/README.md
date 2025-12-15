# procs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#procs

# Load into Docker
nix build .#load-procs-to-docker && ./result/bin/load-procs-to-docker
```
