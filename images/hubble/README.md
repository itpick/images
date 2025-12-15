# hubble

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#hubble

# Load into Docker
nix build .#load-hubble-to-docker && ./result/bin/load-hubble-to-docker
```
