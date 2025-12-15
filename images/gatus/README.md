# gatus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#gatus

# Load into Docker
nix build .#load-gatus-to-docker && ./result/bin/load-gatus-to-docker
```
