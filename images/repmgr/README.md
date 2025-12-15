# repmgr

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#repmgr

# Load into Docker
nix build .#load-repmgr-to-docker && ./result/bin/load-repmgr-to-docker
```
