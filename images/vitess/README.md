# vitess

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vitess

# Load into Docker
nix build .#load-vitess-to-docker && ./result/bin/load-vitess-to-docker
```
