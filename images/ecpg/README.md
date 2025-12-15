# ecpg

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ecpg

# Load into Docker
nix build .#load-ecpg-to-docker && ./result/bin/load-ecpg-to-docker
```
