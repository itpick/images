# distroless

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#distroless

# Load into Docker
nix build .#load-distroless-to-docker && ./result/bin/load-distroless-to-docker
```
