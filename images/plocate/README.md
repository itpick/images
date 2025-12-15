# plocate

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#plocate

# Load into Docker
nix build .#load-plocate-to-docker && ./result/bin/load-plocate-to-docker
```
