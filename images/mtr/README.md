# mtr

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mtr

# Load into Docker
nix build .#load-mtr-to-docker && ./result/bin/load-mtr-to-docker
```
