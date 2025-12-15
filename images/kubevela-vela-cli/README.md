# kubevela-vela-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubevela-vela-cli

# Load into Docker
nix build .#load-kubevela-vela-cli-to-docker && ./result/bin/load-kubevela-vela-cli-to-docker
```
