# langfuse

Minimalist Wolfi-based langfuse images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#langfuse

# Load into Docker
nix build .#load-langfuse-to-docker && ./result/bin/load-langfuse-to-docker
```
