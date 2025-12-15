# gnupg-dirmngr

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gnupg-dirmngr

# Load into Docker
nix build .#load-gnupg-dirmngr-to-docker && ./result/bin/load-gnupg-dirmngr-to-docker
```
