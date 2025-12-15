# eza

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#eza

# Load into Docker
nix build .#load-eza-to-docker && ./result/bin/load-eza-to-docker
```
