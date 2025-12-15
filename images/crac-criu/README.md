# crac-criu

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crac-criu

# Load into Docker
nix build .#load-crac-criu-to-docker && ./result/bin/load-crac-criu-to-docker
```
