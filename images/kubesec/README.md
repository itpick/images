# kubesec

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kubesec

# Load into Docker
nix build .#load-kubesec-to-docker && ./result/bin/load-kubesec-to-docker
```
