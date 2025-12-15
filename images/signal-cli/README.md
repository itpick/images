# signal-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#signal-cli

# Load into Docker
nix build .#load-signal-cli-to-docker && ./result/bin/load-signal-cli-to-docker
```
