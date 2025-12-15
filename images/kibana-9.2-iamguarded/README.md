# kibana-9.2-iamguarded

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kibana-9.2-iamguarded

# Load into Docker
nix build .#load-kibana-9.2-iamguarded-to-docker && ./result/bin/load-kibana-9.2-iamguarded-to-docker
```
