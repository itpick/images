# ini-file

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ini-file

# Load into Docker
nix build .#load-ini-file-to-docker && ./result/bin/load-ini-file-to-docker
```
