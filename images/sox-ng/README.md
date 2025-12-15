# sox-ng

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sox-ng

# Load into Docker
nix build .#load-sox-ng-to-docker && ./result/bin/load-sox-ng-to-docker
```
