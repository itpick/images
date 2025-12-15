# kibana

Your window into the Elastic Stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#kibana

# Load into Docker
nix build .#load-kibana-to-docker && ./result/bin/load-kibana-to-docker
```
