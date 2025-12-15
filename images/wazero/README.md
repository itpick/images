# wazero

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#wazero

# Load into Docker
nix build .#load-wazero-to-docker && ./result/bin/load-wazero-to-docker
```
