# findmnt

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#findmnt

# Load into Docker
nix build .#load-findmnt-to-docker && ./result/bin/load-findmnt-to-docker
```
