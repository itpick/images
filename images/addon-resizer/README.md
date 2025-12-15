# addon-resizer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#addon-resizer

# Load into Docker
nix build .#load-addon-resizer-to-docker && ./result/bin/load-addon-resizer-to-docker
```
