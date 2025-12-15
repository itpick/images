# buf

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#buf

# Load into Docker
nix build .#load-buf-to-docker && ./result/bin/load-buf-to-docker
```
