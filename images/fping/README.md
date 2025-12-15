# fping

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fping

# Load into Docker
nix build .#load-fping-to-docker && ./result/bin/load-fping-to-docker
```
