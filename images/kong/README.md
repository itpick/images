# kong

Kong is a Cloud-Native API Gateway and AI Gateway

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kong

# Load into Docker
nix build .#load-kong-to-docker && ./result/bin/load-kong-to-docker
```
