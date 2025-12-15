# swift

Container image for building Swift applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#swift

# Load into Docker
nix build .#load-swift-to-docker && ./result/bin/load-swift-to-docker
```
