# neuvector-scanner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 11s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#neuvector-scanner

# Load into Docker
nix build .#load-neuvector-scanner-to-docker && ./result/bin/load-neuvector-scanner-to-docker
```
