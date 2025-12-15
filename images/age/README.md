# age

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#age

# Load into Docker
nix build .#load-age-to-docker && ./result/bin/load-age-to-docker
```
