# kayenta

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kayenta

# Load into Docker
nix build .#load-kayenta-to-docker && ./result/bin/load-kayenta-to-docker
```
