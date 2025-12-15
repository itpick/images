# hyperfine

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#hyperfine

# Load into Docker
nix build .#load-hyperfine-to-docker && ./result/bin/load-hyperfine-to-docker
```
