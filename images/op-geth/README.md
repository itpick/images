# op-geth

op-geth is an Ethereum execution client optimized for the Optimism Layer 2 scaling solution

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#op-geth

# Load into Docker
nix build .#load-op-geth-to-docker && ./result/bin/load-op-geth-to-docker
```
