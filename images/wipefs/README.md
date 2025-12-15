# wipefs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wipefs

# Load into Docker
nix build .#load-wipefs-to-docker && ./result/bin/load-wipefs-to-docker
```
