# scanelf

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#scanelf

# Load into Docker
nix build .#load-scanelf-to-docker && ./result/bin/load-scanelf-to-docker
```
