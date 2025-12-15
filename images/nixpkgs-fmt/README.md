# nixpkgs-fmt

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nixpkgs-fmt

# Load into Docker
nix build .#load-nixpkgs-fmt-to-docker && ./result/bin/load-nixpkgs-fmt-to-docker
```
