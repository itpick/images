# langfuse-3-worker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#langfuse-3-worker

# Load into Docker
nix build .#load-langfuse-3-worker-to-docker && ./result/bin/load-langfuse-3-worker-to-docker
```
