# tigerbeetle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tigerbeetle

# Load into Docker
nix build .#load-tigerbeetle-to-docker && ./result/bin/load-tigerbeetle-to-docker
```
