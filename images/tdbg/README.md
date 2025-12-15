# tdbg

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tdbg

# Load into Docker
nix build .#load-tdbg-to-docker && ./result/bin/load-tdbg-to-docker
```
