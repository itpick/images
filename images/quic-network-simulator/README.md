# quic-network-simulator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#quic-network-simulator

# Load into Docker
nix build .#load-quic-network-simulator-to-docker && ./result/bin/load-quic-network-simulator-to-docker
```
