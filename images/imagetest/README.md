# imagetest

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#imagetest

# Load into Docker
nix build .#load-imagetest-to-docker && ./result/bin/load-imagetest-to-docker
```
