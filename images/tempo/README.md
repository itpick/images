# tempo

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#tempo

# Load into Docker
nix build .#load-tempo-to-docker && ./result/bin/load-tempo-to-docker
```
