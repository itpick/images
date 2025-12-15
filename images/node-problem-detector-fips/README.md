# node-problem-detector-fips

Node-problem-detector aims to make various node problems visible to the upstream layers in the cluster management stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#node-problem-detector-fips

# Load into Docker
nix build .#load-node-problem-detector-fips-to-docker && ./result/bin/load-node-problem-detector-fips-to-docker
```
