# asciinema

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#asciinema

# Load into Docker
nix build .#load-asciinema-to-docker && ./result/bin/load-asciinema-to-docker
```
