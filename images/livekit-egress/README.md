# livekit-egress

livekit-egress is an open-source media egress service for real-time audio, video, and data, designed for low latency and scalability

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#livekit-egress

# Load into Docker
nix build .#load-livekit-egress-to-docker && ./result/bin/load-livekit-egress-to-docker
```
