# harfbuzz-icu

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#harfbuzz-icu

# Load into Docker
nix build .#load-harfbuzz-icu-to-docker && ./result/bin/load-harfbuzz-icu-to-docker
```
