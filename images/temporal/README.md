# temporal

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#temporal

# Load into Docker
nix build .#load-temporal-to-docker && ./result/bin/load-temporal-to-docker
```
