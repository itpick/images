# corretto

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#corretto

# Load into Docker
nix build .#load-corretto-to-docker && ./result/bin/load-corretto-to-docker
```
