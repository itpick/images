# fd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fd

# Load into Docker
nix build .#load-fd-to-docker && ./result/bin/load-fd-to-docker
```
