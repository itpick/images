# foxx-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#foxx-cli

# Load into Docker
nix build .#load-foxx-cli-to-docker && ./result/bin/load-foxx-cli-to-docker
```
