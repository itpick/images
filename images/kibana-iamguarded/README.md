# kibana-iamguarded

Your window into the Elastic Stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kibana-iamguarded

# Load into Docker
nix build .#load-kibana-iamguarded-to-docker && ./result/bin/load-kibana-iamguarded-to-docker
```
