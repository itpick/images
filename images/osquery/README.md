# osquery

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#osquery

# Load into Docker
nix build .#load-osquery-to-docker && ./result/bin/load-osquery-to-docker
```
