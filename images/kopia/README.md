# kopia

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kopia

# Load into Docker
nix build .#load-kopia-to-docker && ./result/bin/load-kopia-to-docker
```
