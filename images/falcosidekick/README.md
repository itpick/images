# falcosidekick

Minimalist Wolfi-based image for falcosidekick

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#falcosidekick

# Load into Docker
nix build .#load-falcosidekick-to-docker && ./result/bin/load-falcosidekick-to-docker
```
