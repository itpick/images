# stress-ng

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#stress-ng

# Load into Docker
nix build .#load-stress-ng-to-docker && ./result/bin/load-stress-ng-to-docker
```
