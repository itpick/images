# helix

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#helix

# Load into Docker
nix build .#load-helix-to-docker && ./result/bin/load-helix-to-docker
```
