# kserve

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 11s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kserve

# Load into Docker
nix build .#load-kserve-to-docker && ./result/bin/load-kserve-to-docker
```
