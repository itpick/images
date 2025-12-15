# sed

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sed

# Load into Docker
nix build .#load-sed-to-docker && ./result/bin/load-sed-to-docker
```
