# uuidgen

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#uuidgen

# Load into Docker
nix build .#load-uuidgen-to-docker && ./result/bin/load-uuidgen-to-docker
```
