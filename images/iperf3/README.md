# iperf3

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#iperf3

# Load into Docker
nix build .#load-iperf3-to-docker && ./result/bin/load-iperf3-to-docker
```
