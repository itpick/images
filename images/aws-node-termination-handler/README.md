# aws-node-termination-handler

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-node-termination-handler

# Load into Docker
nix build .#load-aws-node-termination-handler-to-docker && ./result/bin/load-aws-node-termination-handler-to-docker
```
