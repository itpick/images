# sops

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#sops

# Load into Docker
nix build .#load-sops-to-docker && ./result/bin/load-sops-to-docker
```
