# bigbang-base

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bigbang-base

# Load into Docker
nix build .#load-bigbang-base-to-docker && ./result/bin/load-bigbang-base-to-docker
```
