# lsof

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#lsof

# Load into Docker
nix build .#load-lsof-to-docker && ./result/bin/load-lsof-to-docker
```
