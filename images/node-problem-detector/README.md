# node-problem-detector

Node-problem-detector aims to make various node problems visible to the upstream layers in the cluster management stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#node-problem-detector

# Load into Docker
nix build .#load-node-problem-detector-to-docker && ./result/bin/load-node-problem-detector-to-docker
```
