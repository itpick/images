# flux-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#flux-cli

# Load into Docker
nix build .#load-flux-cli-to-docker && ./result/bin/load-flux-cli-to-docker
```
