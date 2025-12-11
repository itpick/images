# go

Container image for building Go applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#go

# Load into Docker
nix build .#load-go-to-docker && ./result/bin/load-go-to-docker
```
