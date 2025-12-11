# earthly

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#earthly

# Load into Docker
nix build .#load-earthly-to-docker && ./result/bin/load-earthly-to-docker
```
