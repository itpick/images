# omnictl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#omnictl

# Load into Docker
nix build .#load-omnictl-to-docker && ./result/bin/load-omnictl-to-docker
```
