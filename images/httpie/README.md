# httpie

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#httpie

# Load into Docker
nix build .#load-httpie-to-docker && ./result/bin/load-httpie-to-docker
```
