# enterprise-logs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#enterprise-logs

# Load into Docker
nix build .#load-enterprise-logs-to-docker && ./result/bin/load-enterprise-logs-to-docker
```
