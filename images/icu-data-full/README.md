# icu-data-full

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#icu-data-full

# Load into Docker
nix build .#load-icu-data-full-to-docker && ./result/bin/load-icu-data-full-to-docker
```
