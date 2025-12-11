# tempo-query

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#tempo-query

# Load into Docker
nix build .#load-tempo-query-to-docker && ./result/bin/load-tempo-query-to-docker
```
