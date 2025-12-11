# hadolint

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#hadolint

# Load into Docker
nix build .#load-hadolint-to-docker && ./result/bin/load-hadolint-to-docker
```
