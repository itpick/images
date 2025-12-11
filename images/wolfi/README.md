# wolfi

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#wolfi

# Load into Docker
nix build .#load-wolfi-to-docker && ./result/bin/load-wolfi-to-docker
```
