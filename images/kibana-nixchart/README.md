# kibana-nixchart

Your window into the Elastic Stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kibana-nixchart

# Load into Docker
nix build .#load-kibana-nixchart-to-docker && ./result/bin/load-kibana-nixchart-to-docker
```
