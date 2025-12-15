# nushell

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nushell

# Load into Docker
nix build .#load-nushell-to-docker && ./result/bin/load-nushell-to-docker
```
