# health-checker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#health-checker

# Load into Docker
nix build .#load-health-checker-to-docker && ./result/bin/load-health-checker-to-docker
```
