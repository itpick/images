# hubble-certgen

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#hubble-certgen

# Load into Docker
nix build .#load-hubble-certgen-to-docker && ./result/bin/load-hubble-certgen-to-docker
```
