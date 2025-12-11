# nginx-unprivileged

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#nginx-unprivileged

# Load into Docker
nix build .#load-nginx-unprivileged-to-docker && ./result/bin/load-nginx-unprivileged-to-docker
```
