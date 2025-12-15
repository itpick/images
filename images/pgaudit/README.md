# pgaudit

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pgaudit

# Load into Docker
nix build .#load-pgaudit-to-docker && ./result/bin/load-pgaudit-to-docker
```
