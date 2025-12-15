# act

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#act

# Load into Docker
nix build .#load-act-to-docker && ./result/bin/load-act-to-docker
```
