# ratify-licensechecker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ratify-licensechecker

# Load into Docker
nix build .#load-ratify-licensechecker-to-docker && ./result/bin/load-ratify-licensechecker-to-docker
```
