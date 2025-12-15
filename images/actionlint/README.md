# actionlint

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#actionlint

# Load into Docker
nix build .#load-actionlint-to-docker && ./result/bin/load-actionlint-to-docker
```
