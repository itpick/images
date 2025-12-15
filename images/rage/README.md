# rage

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rage

# Load into Docker
nix build .#load-rage-to-docker && ./result/bin/load-rage-to-docker
```
