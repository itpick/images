# starship

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#starship

# Load into Docker
nix build .#load-starship-to-docker && ./result/bin/load-starship-to-docker
```
