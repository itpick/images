# langfuse-worker

Minimalist Wolfi-based langfuse images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#langfuse-worker

# Load into Docker
nix build .#load-langfuse-worker-to-docker && ./result/bin/load-langfuse-worker-to-docker
```
