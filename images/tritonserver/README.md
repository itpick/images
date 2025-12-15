# tritonserver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver

# Load into Docker
nix build .#load-tritonserver-to-docker && ./result/bin/load-tritonserver-to-docker
```
